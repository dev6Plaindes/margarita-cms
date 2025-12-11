<?php 

namespace App\Down;

use App\Utilitarian\{FG,MP3File};
use App\Model\{Portafolio,Product, Category, Menu, Teacher, MenuPortafolio,MenuProduct, Characteristic, DesignIcon, Topic, SubTopic, TemplateView};
use Illuminate\Database\Capsule\Manager as Capsule;

class PortafolioDown {

    public function index($request) {
		$rsp = FG::responseDefault();
        try {
            $type_id = $request->getAttribute('type_id');
            $company_id = $_SESSION['COMPANY_ID'];
            $products = Portafolio::where('company_id', $company_id)->where('type_id',$type_id)->get();
            $rsp['success'] = true;
            $rsp['data'] = compact('products', 'company_id','type_id');
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function create($request) {
		$rsp = FG::responseDefault();
        try {
            $type_id = $request->getAttribute('type_id');
            $company_id = $_SESSION['COMPANY_ID'];
            $product = new Portafolio();
            $categories = Category::where('company_id', $company_id)->get();
            //$menus = Menu::where('company_id', $company_id)->get();
            $menus = Capsule::table('menus')
                        ->join('templates_views', 'menus.template_view_id', '=', 'templates_views.id')
                        ->whereIN('templates_views.index',[TemplateView::PORTAFOLIOS,TemplateView::PORTAFOLIOS_AUDIO])
                        ->where('menus.company_id', $company_id)
                        ->select('menus.*')->get();
            if (count($menus) > 0) {
            $parent_ids = array();
            foreach ($menus as $k => $menu) {
                if ($menu->parent_id > 0) {
                    array_push($parent_ids, $menu->parent_id);
                }
            }
            $auxs = array();
            foreach ($menus as $k => $menu) {
                if (!in_array($menu->id, $parent_ids)) {
                    array_push($auxs, $menu);
                }
            }
            $menus = $auxs;
            }
            $teachers = Teacher::where('company_id', $company_id)->get();
            $rsp['success'] = true;
            $rsp['data'] = compact('product', 'categories', 'menus', 'company_id', 'teachers','type_id');
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function edit($request) {
		$rsp = FG::responseDefault();
        try {
            $id = $request->getAttribute('id');
            if (!is_numeric($id)) {
                throw new \Exception('El parametro debe ser númerico');   
            }
            $company_id = $_SESSION['COMPANY_ID'];
            
            $product = Portafolio::with([
                'menus',
                'topics_portafolios' => function($q) {
                    $q->with([
                        'subtopics_portafolios'=> function ($query) { 
                            $query->with(['design_icon'])->orderBy('order', 'asc'); 
                        }
                    ])->orderBy('order', 'asc');
                }
            ])->where('company_id', $company_id)->where('id', $id)->first();

           
            $categories = Category::where('company_id', $company_id)->get();
            
            $menus = Capsule::table('menus')
                                ->join('templates_views', 'menus.template_view_id', '=', 'templates_views.id')
                                ->whereIN('templates_views.index', [TemplateView::PORTAFOLIOS,TemplateView::PORTAFOLIOS_AUDIO])
                                ->where('menus.company_id', $company_id)
                                ->select('menus.*')->get();
            if (count($menus) > 0) {
                $parent_ids = array();
                foreach ($menus as $k => $menu) {
                    if ($menu->parent_id > 0) {
                        array_push($parent_ids, $menu->parent_id);
                    }
                }
                $auxs = array();
                foreach ($menus as $k => $menu) {
                    if (!in_array($menu->id, $parent_ids)) {
                        array_push($auxs, $menu);
                    }
                }
                $menus = $auxs;
            }
            // $menus = Menu::where('company_id', $company_id)->get();
            $teachers = Teacher::where('company_id', $company_id)->get();
            $designs_icons = DesignIcon::where('company_id', $company_id)->get();
            $topics = $product->topics_portafolios;
            $rsp['success'] = true;
            $rsp['data'] = compact('product', 'categories', 'menus', 'company_id', 'teachers', 'designs_icons', 'topics');
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function saveData($request) {
		$rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());

            $product                = is_numeric($id) ? Portafolio::where('id', $id)->first() : new Portafolio();
            $product->name          = $name;
            $product->caption       = $caption;
            $product->category_id   = $category_id;
            $product->url           = $url;
            $product->description   = $description;
            $product->status        = (int)$status;
            $product->company_id    = $company_id;
            $product->type_id       = $type_id;
            $product->slug          = FG::slugify($name);
            $product->overview      = $overview;
            $product->teacher_id    = $teacher_id;
            $product->date          = $date;

            if (is_numeric($id)) {
                $all = Portafolio::where('slug', $product->slug)->where('company_id', $company_id)->where('id', '!=', $id)->get();
            } else {
                $all = Portafolio::where('slug', $product->slug)->where('company_id', $company_id)->get();
            }
            if (count($all) > 0) {
                throw new \Exception('Ya existe un producto con el mismo nombre');
            }

            $product->save();

            if (count($menus) > 0) {
                if (is_numeric($id)) {
                    MenuPortafolio::where('portafolio_id', $id)->delete();
                }
                $data = array();
                foreach ($menus as $k => $o) {
                    array_push($data, ['menu_id'=>$o, 'portafolio_id'=>$product->id]);
                }
                MenuPortafolio::insert($data);
            }

            $uploads = $request->getUploadedFiles();

            $baseurl = "upload/portafolio/";
            $fullpath = __DIR__."/../../public/".$baseurl;
            if (!is_dir($fullpath)) {
                mkdir($fullpath, 0777,true);
            }

            $file = $uploads['image'];
            if ($file->getError() == UPLOAD_ERR_OK) {
                $uniqid = uniqid(time());
                $fileName = strtolower($file->getClientFilename());
                $clientMediaType = strtolower($file->getClientMediaType());
                $size = strtolower($file->getSize());
                $data_file = [
                    "name" => $fileName,
                    "typeMedia" => $clientMediaType,
                    "size" => $size
                ];

                $path = $baseurl."$uniqid-$fileName";
                $file->moveTo($path);

                if ($clientMediaType == 'audio/mpeg') {
                    $mp3file = new MP3File("public\upload\portafolio\166027962762f5db4bbe0d5-audio.mp3");
                    $duration = $mp3file->getDuration();
                    $duration_formater = MP3File::formatTime($duration);
                }

                //unlink($basepath.$logo->logo);
                $product->data_file = json_encode($data_file);
                $product->image = "/$path";
                $product->save();
            }

            $rsp['success'] = true;
            $rsp['data'] = compact('product');
            $rsp['message'] = 'Se guardo correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function remove($request) {
		$rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());
            if (!$id) {
                throw new \Exception('El parametro id es obligatorio');
            }
            $product = Portafolio::where('id', $id)->first();
            if (!$product) {
                throw new \Exception('No se logró encontrar la sección a eliminar');
            }
            $product->deleted_at = FG::getDateHour();
            $product->save();

            $rsp['success'] = true;
            $rsp['message'] = 'Se elimino correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}    
}