<?php 

namespace App\Controller;

use App\Down\{SectionDown};

class SectionController extends BaseController
{
	public function index($request) {
		$down = new SectionDown();
        $rsp = $down->index($request);
		return View::render('admin/sections/index.twig', compact('rsp'));
	}

	public function saveData($request) {
		$down = new SectionDown();
        return $down->saveData($request);
	}

	public function remove($request) {
		$down = new SectionDown();
        return $down->remove($request);
	}

	public function liberate($request) {
		$down = new SectionDown();
        return $down->liberate($request);
	}

	public function position($request) {
		$down = new SectionDown();
        return $down->position($request);
	}
	
}

?>