<?php 

namespace App\Controller;

use App\Down\{GalleryDown};

class GalleryController extends BaseController
{
	public function index($request) {
		$down = new GalleryDown();
        $rsp = $down->index($request);
		return View::render('admin/gallery/index.twig', compact('rsp'));
	}

	public function handle($request) {
		$down = new GalleryDown();
        return $down->handle($request);
	}

	public function remove($request) {
		$down = new GalleryDown();
        return $down->remove($request);
	}

	public function save($request) {
		$down = new GalleryDown();
        return $down->saveData($request);
	}

	public function order($request) {
		$down = new GalleryDown();
        return $down->order($request);
	}
}

?>