<?php

namespace App\Controller;

use App\Down\{MessageDown};

class MessageController extends BaseController
{
	public function index($request) {
		$down = new MessageDown();
        $rsp = $down->list($request);
		return View::render('admin/messages/index.twig', compact('rsp'));
	}

	public function addSubscription($request){
		$down = new MessageDown();
        return $down->addSubscription($request);
	}

	public function addMessage($request){
		$down = new MessageDown();
        return $down->addMessage($request);
	}

	public function addMessageContact($request){
		$down = new MessageDown();
        return $down->addMessageContact($request);
	}

	public function addMessageContact_cl($request){
		$down = new MessageDown();
        return $down->addMessageContact_cl($request);
	}

	public function newMessage($request){
		$down = new MessageDown();
        return $down->newMessage($request);
	}
}

?>