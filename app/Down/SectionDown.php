<?php 

namespace App\Down;

use App\Utilitarian\{FG};
use App\Model\{Section, Company, Menu, MenuSection, Content, ContentType, SectionContentType};

class SectionDown {

    public function index($request) {
		$rsp = FG::responseDefault();
        try {
            $company_id = $_SESSION['COMPANY_ID'];
            $sections = Section::with(['menus', 'contents_types'])->where('company_id', $company_id)->get();
            $section_ids = array();
            foreach ($sections as $k => $o) {
                $section_ids[] = $o->id;
                foreach ($o->contents_types as $k2 => $o2) {
                    $sections[$k]->contents_types[$k2]->settings = json_decode($sections[$k]->contents_types[$k2]->settings);
                }
            }
            $contents = Content::with(['colors', 'images'])->whereIn('section_id', $section_ids)->orderBy('order', 'asc')->get();
            $keys_contents = array();
            foreach ($contents as $k => $o) 
                $keys_contents[$o->section_id][] = $o;
            foreach ($sections as $k => $o)
                $sections[$k]->contents = isset($keys_contents[$o->id]) ? $keys_contents[$o->id] : [];
            $menus = Menu::where('company_id', $company_id)->get();
            $contents_types = ContentType::where('company_id', $company_id)->get();
            foreach ($contents_types as $k => $o) {
                $contents_types[$k]->settings = json_decode($o->settings);
            }
            $rsp['success'] = true;
            $rsp['data'] = compact('sections', 'menus', 'company_id', 'contents_types');
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

            $section              = is_numeric($id) ? Section::getSectionById($id) : new Section();
            $section->name        = $name;
            $section->description = $description;
            $section->caption     = $caption;
            $section->color       = $color;
            $section->status      = isset($status) ? $status : 0;
            $section->company_id  = $company_id;
            $section->type_id     = $type_id;
            $section->save();

            if (count($menus) > 0) {
                if (is_numeric($id)) {
                    MenuSection::where('section_id', $id)->delete();
                }
                $data = array();
                foreach ($menus as $k => $o) {
                    array_push($data, ['menu_id'=>$o, 'section_id'=>$section->id]);
                }
                MenuSection::insert($data);
            }

            if (count($types) > 0) {
                if (is_numeric($id)) {
                    SectionContentType::where('section_id', $id)->delete();
                }
                $data = array();
                foreach ($types as $k => $o) {
                    array_push($data, ['type_id'=>$o, 'section_id'=>$section->id]);
                }
                SectionContentType::insert($data);
            }

            $rsp['success'] = true;
            $rsp['data'] = compact('section');
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
            $section = Section::getSectionById($id);
            if (!$section) {
                throw new \Exception('No se logró encontrar la sección a eliminar');
            }
            $section->deleted_at = FG::getDateHour();
            $section->save();

            $rsp['success'] = true;
            $rsp['message'] = 'Se elimino correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function liberate($request) {
		$rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());
            if (!$section_id) {
                throw new \Exception('El section_id es un campo obligatorio');
            }
            if (!$menu_id) {
                throw new \Exception('El menu_id es un campo obligatorio');
            }

            MenuSection::where('section_id', $section_id)->where('menu_id', $menu_id)->delete();

            $rsp['success'] = true;
            $rsp['message'] = 'Se elimino correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function position($request) {
		$rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());
            if (!$id) {
                throw new \Exception('El parametro id es obligatorio');
            }
            $section = Section::getSectionById($id);
            if (!$section) {
                throw new \Exception('No se logró encontrar la sección a eliminar');
            }
            $section->deleted_at = FG::getDateHour();
            $section->save();

            $rsp['success'] = true;
            $rsp['message'] = 'Se elimino correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

}