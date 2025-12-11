<?php

namespace App\Controller;

use App\Down\{PaymentDown};

class PaymentController extends BaseController
{
	/*public function index($request) {
		$payment = new Payment();
        $rsp = $payment->index($request);
		return $this->renderHTML('admin/payments/index.twig', compact('rsp'));
	}*/

	public function viewPurchaseProduct($request) {
		$down = new PaymentDown();
		$rsp = $down->viewPurchaseProduct($request);
		return $this->renderHTML('/product/payment.twig', $rsp["data"], $request);
	}

	public function viewPurchaseCode($request) {
		$down = new PaymentDown();
		$rsp = $down->viewPurchaseCode($request);
		return $this->renderHTML('/product/payment.twig', $rsp["data"], $request);
	}

	public function purchaseCode($request) {
		$down = new PaymentDown();
		return $down->purchaseCode($request);
	}

	public function purchaseProduct($request) {
		$down = new PaymentDown();
		return $down->purchaseProduct($request);
	}
}

?>