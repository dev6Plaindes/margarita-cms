<?php 

namespace App\Down;

use App\Utilitarian\{FG};
use App\Model\{ Company, Inscription, Menu, Section, MenuSection, Content, ContentFile, ContentImage, ContentColor, ContentType, Product, MenuProduct, CompanyColor, SectionContentType, Portafolio, MenuPortafolio, Teacher };
use Illuminate\Database\Capsule\Manager as Capsule;

class CompanyDown {

	public function dashboard($request) {
		$rsp = FG::responseDefault();
        try {
            $company_id = $_SESSION['COMPANY_ID'];
            $inscriptions = Inscription::with(['product'])->where('company_id', $company_id)->orderBy('id', 'desc')->get();
            $graph = array('status' => []);
            $status = [
                ['quantity' => 0, 'label' => 'Pagado'],
                ['quantity' => 0, 'label' => 'Enviado'],
                ['quantity' => 0, 'label' => 'Rechazado'],
                ['quantity' => 0, 'label' => 'Pendiente']
            ];
            $recents = array(); 
            foreach ($inscriptions as $k => $inscription) {
                switch ($inscription->status) {
                    case Inscription::PAGADO:
                        $status[0]['quantity'] ++;
                    break;
                    case Inscription::ENVIADO:
                        $status[1]['quantity'] ++;
                    break;                    
                    case Inscription::RECHAZADO:
                        $status[2]['quantity'] ++;
                    break;  
                    case Inscription::PENDIENTE:
                        $status[3]['quantity'] ++;
                    break;                    
                    default:
                    # code...
                    break;
                }
                if ($k < 5) {
                    $recents[] = $inscription;
                }
                $inscriptions[$k]->date = FG::getFormatDateTime($inscription->created_at, 'd/m/y');
                $inscriptions[$k]->time = FG::getFormatDateTime($inscription->created_at, 'H:i');
            }
            $graph['status'] = $status;
            $rsp['success'] = true;
            $rsp['data'] = compact('company_id', 'inscriptions', 'graph', 'recents');
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function indexSettings($request) {
        $rsp = FG::responseDefault(); // si este sí es static, lo puedes dejar
        try {
            $fg = new \App\Utilitarian\FG(); // instanciamos la clase

            $company_id = $_SESSION['COMPANY_ID'];
            $company = $fg->getCurrentCompany(); // ahora llamamos al método de instancia

            if (!isset($company['settings']['aside'])) {
                $company['settings']['aside'] = $fg->getSettingsCompanyDefault()['aside'];
            }

            $settings = $company['settings'];
            $rsp['success'] = true;
            $rsp['data'] = compact('company_id', 'settings');
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
    }


    public function saveSettings($request) {
		$rsp = FG::responseDefault();
        try {

            $input = $request->getParsedBody();

            $aside = array();
            foreach ($input as $key => $item) {
                $aside[$key] = [ 'hide' => $item ];
            }

            // $settings = [
            //     'aside' => $aside
            // ];

            $company_id = $_SESSION['COMPANY_ID'];
            $company = Company::where('id', $company_id)->first();
            $settings ? json_decode($company->settings, true) : [];
            if (!isset($settings['aside'])) {
                $settings['aside'] = $aside;
            }
            $company->settings = json_encode($settings);
            $company->save();

            $rsp['success'] = true;
            $rsp['message'] = 'Se guardo correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function duplicateContent($request) {
		$rsp = FG::responseDefault();
        try {

            $input = $request->getParsedBody();
            $origin_company_id = $input['origin_company_id'];
            $receiver_company_id = $input['receiver_company_id'];
            $key = $input['key'];

            if ($key != 'margarita#2022') {
                throw new \Exception('No tiene permisos suficientes para este servicio, intentelo más tarde.');
            }

            if (!$origin_company_id && is_numeric($origin_company_id)) {
                throw new \Exception('El origin_company_id es un campo númerico');
            }

            if (!$receiver_company_id && !is_numeric($receiver_company_id)) {
                throw new \Exception('El origin_company_id es un campo númerico');
            }

            $origin_company = Capsule::table('companies')->where('deleted_at')->where('id', $origin_company_id)->first();
            if (!$origin_company) {
                throw new \Exception('No se encontro la empresa de origen');
            }

            $receiver_company = Capsule::table('companies')->where('deleted_at')->where('id', $receiver_company_id)->first();
            if (!$receiver_company) {
                throw new \Exception('No se encontro la empresa receptora');
            }

            $keys_contents_types = array();
            $keys_sections = array();
            $keys_contents_types_ids = array();
            $keys_teachers_ids = array();

            $contentsTypes = ContentType::where('deleted_at')->where('company_id', $origin_company_id)->get();
            $menus = Menu::where('deleted_at')->where('company_id', $origin_company_id)->orderBy('parent_id', 'ASC')->get();
            $sections = Section::where('deleted_at')->where('company_id', $origin_company_id)->get();
            $contents = Content::where('deleted_at')->where('company_id', $origin_company_id)->get();
            $teachers = Teacher::where('deleted_at')->where('company_id', $origin_company_id)->get();
            
            foreach ($teachers as $key => $item) {
                $newTeacher = $item->replicate();
                $newTeacher->image = NULL;
                $newTeacher->company_id = $receiver_company_id;
                $newTeacher->save();
                $keys_teachers_ids[$item->id] = $newTeacher->id;
            }

            foreach ($contentsTypes as $k => $contentType) {
                $newContentType = $contentType->replicate();
                $newContentType->company_id = $receiver_company_id;
                $newContentType->save();
                $keys_contents_types_ids[$contentType->id] = $newContentType->id;
                $keys_contents_types[] = ['id'=>$contentType->id, 'newid' => $newContentType->id];
            }
            
            $keys_sections_ids = array();
            $keys_menus_ids = array();
            $menu_ids = array();

            foreach ($sections as $k => $section) {
                $newSection = $section->replicate();
                $newSection->company_id = $receiver_company_id;
                $newSection->save();
                $keys_sections_ids[$section->id] = $newSection->id;
                $keys_sections[] = ['id'=>$section->id, 'newid' => $newSection->id];
            }

            foreach ($menus as $k => $item) {
                $newMenu = $item->replicate();
                $newMenu->image = NULL;
                $newMenu->company_id = $receiver_company_id;
                $newMenu->save();
                $keys_menus_ids[$item->id] = $newMenu->id;
                $menu_ids[] = $item->id;
            }

            $menusSections = MenuSection::whereIn('menu_id', $menu_ids)->get();
            foreach ($menusSections as $k => $item) {
                if (isset($keys_menus_ids[$item->menu_id]) && isset($keys_sections_ids[$item->section_id])) {
                    $newMenuSection = new MenuSection();
                    $newMenuSection->menu_id = $keys_menus_ids[$item->menu_id];
                    $newMenuSection->section_id = $keys_sections_ids[$item->section_id];
                    $newMenuSection->save();
                }
            }
            
            foreach ($contents as $k => $item) {
                $newContent = $item->replicate();
                $newContent->section_id = @$keys_sections_ids[$item->section_id];
                $newContent->type_id = @$keys_contents_types_ids[$item->type_id];
                $newContent->company_id = $receiver_company_id;
                $newContent->save();
            }

            $products = Product::where('deleted_at')->where('company_id', $origin_company_id)->get();
            $keys_products_ids = array();
            foreach ($products as $k2 => $product) {
                $newProduct = $product->replicate();
                $newProduct->company_id = $receiver_company_id;
                $newProduct->image = NULL;
                $newProduct->teacher_id = @$keys_teachers_ids[$product->teacher_id];
                $newProduct->save();
                $keys_products_ids[$item->id] = $newProduct->id;
            }

            $menusProducts = MenuProduct::whereIn('menu_id', $menu_ids)->get();
            foreach ($menusProducts as $k => $item) {
                if (isset($keys_menus_ids[$item->menu_id]) && isset($keys_products_ids[$item->product_id])) {
                    $newProductSection = new MenuProduct();
                    $newProductSection->menu_id = $keys_menus_ids[$item->menu_id];
                    $newProductSection->product_id = $keys_products_ids[$item->product_id];
                    $newProductSection->save();
                }
            }
            
            $companyColors = CompanyColor::where('deleted_at')->where('company_id', $origin_company_id)->get();
            foreach ($companyColors as $k => $companyColor) {
                $newCompanyColor = $companyColor->replicate();
                $newCompanyColor->company_id = $receiver_company_id;
                $newCompanyColor->save();
            }

            $sections_types_ids = array();

            foreach ($keys_sections as $key => $item) {
                $sections_types_ids[] = $item['id'];
            }

            $sectionContentTypes = SectionContentType::whereIn('section_id', $sections_types_ids)->get();
            foreach ($sectionContentTypes as $key => $item) {
                $section_id = 0; $type_id = 0;
                foreach ($keys_sections as $k1 => $item1) {
                    if ($item1['id'] == $item->section_id) {
                        $section_id = $item1['newid'];
                        break;
                    }
                }
                foreach ($keys_contents_types as $k1 => $item1) {
                    if ($item1['id'] == $item->type_id) {
                        $type_id = $item1['newid'];
                        break;
                    }
                }
                
                if ($section_id > 0 && $type_id > 0) {
                    $sectionContentType = new SectionContentType();
                    $sectionContentType->section_id = $section_id;
                    $sectionContentType->type_id = $type_id;
                    $sectionContentType->save();
                }
            }

            $portafolios = Portafolio::where('deleted_at')->where('company_id', $origin_company_id)->get();
            $keys_portafolios_ids = array();
            foreach ($portafolios as $k2 => $item) {
                $newPortafolio = $item->replicate();
                $newPortafolio->company_id = $receiver_company_id;
                $newPortafolio->image = NULL;
                $newPortafolio->teacher_id = @$keys_teachers_ids[$item->teacher_id];
                $newPortafolio->save();
                $keys_portafolios_ids[$item->id] = $newPortafolio->id;
            }

            $menusPortafolios = MenuPortafolio::whereIn('menu_id', $menu_ids)->get();
            foreach ($menusPortafolios as $k => $item) {
                if (isset($keys_menus_ids[$item->menu_id]) && isset($keys_portafolios_ids[$item->portafolio_id])) {
                    $newPortafolioSection = new MenuPortafolio();
                    $newPortafolioSection->menu_id = $keys_menus_ids[$item->menu_id];
                    $newPortafolioSection->portafolio_id = $keys_portafolios_ids[$item->portafolio_id];
                    $newPortafolioSection->save();
                }
            }

            $rsp['success'] = true;
            $rsp['message'] = 'Se duplico correctamente el contenido';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}
}