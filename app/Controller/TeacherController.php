<?php 

namespace App\Controller;

use App\Down\{TeacherDown};

class TeacherController extends BaseController
{
	public function index($request) {
		$down = new TeacherDown();
        $rsp = $down->index($request);
		return View::render('admin/teachers/index.twig', compact('rsp'));
	}

	public function save($request) {
		$down = new TeacherDown();
        return $down->save($request);
	}

	public function remove($request) {
		$down = new TeacherDown();
        return $down->remove($request);
	}	
}

?>