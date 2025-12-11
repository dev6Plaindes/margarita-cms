<?php 

namespace App\Controller;

use App\Down\{ContentDown};

class ContentController extends BaseController {

	public function index($request) {
		$down = new ContentDown();
        $rsp = $down->index($request);
		return View::render('admin/contents/index.twig', compact('rsp'));
	}

	public function edit($request) {
		$down = new ContentDown();
        $rsp = $down->edit($request);
		return View::render('admin/contents/edit.twig', compact('rsp'));
	}

	public function create($request) {
		$down = new ContentDown();
        $rsp = $down->create($request);
		return View::render('admin/contents/form.twig', compact('rsp'));
	}

	public function saveData($request) {
		$down = new ContentDown();
        return $down->saveData($request);
	}

	public function remove($request) {
		$down = new ContentDown();
        return $down->remove($request);
	}
	
}

?>