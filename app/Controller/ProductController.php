<?php 

namespace App\Controller;

use App\Model\{Product};
use App\Down\{ProductDown};

class ProductController extends BaseController
{
	public function index($request) {
		$product = new ProductDown();
        $rsp = $product->index($request);
		return View::render('admin/products/index.twig', compact('rsp'));
	}

	public function edit($request) {
		$product = new ProductDown();
        $rsp = $product->edit($request);
		return View::render('admin/products/edit.twig', compact('rsp'));
	}

	public function create($request) {
		$product = new ProductDown();
        $rsp = $product->create($request);
		return View::render('admin/products/create.twig', compact('rsp'));
	}

	public function saveData($request) {
		$product = new ProductDown();
        return $product->saveData($request);
	}

	public function remove($request) {
		$product = new ProductDown();
        return $product->remove($request);
	}

	public function saveCharacteristic($request) {
		$product = new ProductDown();
        return $product->saveCharacteristic($request);
	}

	public function removeCharacteristic($request) {
		$product = new ProductDown();
        return $product->removeCharacteristic($request);
	}
	
	public function storeImage($request) {
		$product = new ProductDown();
        return $product->storeImage($request);
	}

	public function removeImage($request) {
		$product = new ProductDown();
        return $product->removeImage($request);
	}
	
}

?>