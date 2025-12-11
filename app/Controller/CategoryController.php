<?php 

namespace App\Controller;

use App\Down\{CategoryDown};

class CategoryController extends BaseController
{
	public function index($request) {
		$down = new CategoryDown();
        $rsp = $down->index($request);
		return View::render('admin/categories/index.twig', compact('rsp'));
	}

	public function saveData($request) {
		$down = new CategoryDown();
        return $down->saveData($request);
	}

	public function remove($request) {
		$down = new CategoryDown();
        return $down->remove($request);
	}
}

?>