<?php 

namespace App\Controller;

use App\Model\{Portafolio};
use App\Down\{PortafolioDown};

class PortafolioController extends BaseController
{
	public function index($request) {
		$product = new PortafolioDown();
		$request = $request->withAttribute("type_id", 1);
        $rsp = $product->index($request);
		//var_dump(json_encode($rsp));exit;
		return View::render('admin/portafolios/index.twig', compact('rsp'));
	}

	public function multimedia($request) {
		$product = new PortafolioDown();
		$request = $request->withAttribute("type_id", 2);
        $rsp = $product->index($request);
		
		return View::render('admin/portafolios/index.twig', compact('rsp'));
	}

	public function create($request) {
		$product = new PortafolioDown();
        $rsp = $product->create($request);
		return View::render('admin/portafolios/create.twig', compact('rsp'));
	}

	public function saveData($request) {
		$product = new PortafolioDown();
        return $product->saveData($request);
	}

	public function edit($request) {
		$product = new PortafolioDown();
        $rsp = $product->edit($request);
		return View::render('admin/portafolios/edit.twig', compact('rsp'));
	}

	public function remove($request) {
		$product = new PortafolioDown();
        return $product->remove($request);
	}

}

?>