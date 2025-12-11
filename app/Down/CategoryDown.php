<?php 

namespace App\Down;

use App\Utilitarian\{FG};
use App\Model\{Category, Company};

class CategoryDown {

	public function index($request) {
		$rsp = FG::responseDefault();
        try {
            $company_id = $_SESSION['COMPANY_ID'];
            $categories = Category::where('company_id', $company_id)->get();
            $rsp['success'] = true;
            $rsp['data'] = compact('categories', 'company_id');
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

            $category             = is_numeric($id) ? Category::where('id', $id)->first() : new Category();
            $category->name       = $name;
            $category->color      = $color;
            $category->company_id = $company_id;
            $category->save();

            $rsp['success'] = true;
            $rsp['data'] = compact('category');
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
            $category = Category::where('id', $id)->first();
            if (!$category) {
                throw new \Exception('No se logró encontrar la sección a eliminar');
            }
            $category->deleted_at = FG::getDateHour();
            $category->save();

            $rsp['success'] = true;
            $rsp['message'] = 'Se elimino correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}
}