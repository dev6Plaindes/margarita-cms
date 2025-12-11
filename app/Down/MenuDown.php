<?php 

namespace App\Down;

use Illuminate\Database\Capsule\Manager as Capsule;
use App\Utilitarian\{FG};
use App\Model\{Menu, MenuSection, Company, User, TemplateView};

class MenuDown {

    public function manage($request) {
		$rsp = FG::responseDefault();
        try {
            $att_company = $request->getAttribute('att_company');

            $company_id = $_SESSION['COMPANY_ID'];
            $menus = Menu::getBuilMenuByCompanyId($company_id);
            /*if($_SESSION['USER']->profile_id == User::ADMIN_PROFILE) {
                $auxs = array();
                foreach ($menus as $k => $menu) {
                    if ($menu->template_view->index == TemplateView::PRODUCT_INDEX) {
                        array_push($auxs, $menu);
                    }
                }
                $menus = $auxs;
            }*/
            $all = Menu::with(['sections', 'template_view'])->where('company_id', $company_id)->where('parent_id', 0)->get();
            /*if($_SESSION['USER']->profile_id == User::ADMIN_PROFILE) {
                $auxs = array();
                foreach ($all as $k => $menu) {
                    if ($menu->template_view->index == TemplateView::PRODUCT_INDEX) {
                        array_push($auxs, $menu);
                    }
                }
                $all = $auxs;
            }*/
            $templates_views = TemplateView::where('template_id', $att_company["template_id"])->get();
            $rsp['success'] = true;
            $rsp['data'] = compact('menus', 'company_id', 'all', 'templates_views');
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
            $template_view_id  = $template_view_id ? $template_view_id : TemplateView::PRODUCT_INDEX; 
            $menu              = is_numeric($id) ? Menu::with(['sections'])->where('id', $id)->first() : new Menu();
            $menu->name        = $name;
            $menu->order       = $order;
            $menu->url         = $url;
            $menu->slug        = FG::slugify($name);
            $menu->company_id  = $company_id;
            $menu->parent_id   = ($id == $parent_id) ? (int)$menu->parent_id : $parent_id;
            $menu->template_view_id = $_SESSION['USER']->profile_id ==  User::MASTER_PROFILE ? $template_view_id : TemplateView::PRODUCT_INDEX;
            $menu->save();

            $upload = $request->getUploadedFiles();
            $baseurl = "upload/menu/";
            $fullpath = __DIR__."/../../public/".$baseurl;
            if (!is_dir($fullpath)) {
                mkdir($fullpath, 0777,true);
            }

            $file = $upload['image'];
            if ($file->getError() == UPLOAD_ERR_OK) {
                $uniqid = uniqid(time());
                $fileName = strtolower($file->getClientFilename());
                $path = $baseurl."$uniqid-$fileName";
                $file->moveTo($path);
                unlink(__DIR__."/../../public/".$menu->image);
                $menu->image = "/$path";
                $menu->save();
            }

            $rsp['success'] = true;
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
            $menu = Menu::with(['sections'])->where('id', $id)->first();
            if (!$menu) {
                throw new \Exception('No se logró encontrar el menú a eliminar');
            }
            $menu->deleted_at = FG::getDateHour();
            $menu->save();

            $rsp['success'] = true;
            $rsp['message'] = 'Se elimino correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}
    
	public function scheme($request) {
		$rsp = FG::responseDefault();
        try {
            $menus = Menu::where('deleted_at')->get();
            $rsp['success'] = true;
            $rsp['data'] = compact('menus');
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function getMenu($request){
        $company = $request->getAttribute('att_company');
        $menu = new Menu();
		return $menu->getBuilMenuByCompanyId($company["id"]);
    }

}