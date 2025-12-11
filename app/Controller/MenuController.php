<?php 

namespace App\Controller;

use App\Down\{MenuDown};

class MenuController extends BaseController
{
	public function index($request) {
		$down = new MenuDown();
        $rsp = $down->manage($request);
		return View::render('admin/menus/index.twig', compact('rsp'));
	}

	public function saveData($request) {
		$down = new MenuDown();
        return $down->saveData($request);
	}

	public function remove($request) {
		$down = new MenuDown();
        return $down->remove($request);
	}
}

?>