<?php

namespace App\Controller;

use App\Model\{User};

use Illuminate\Database\Capsule\Manager as Capsule;

class UserController extends BaseController
{
	public function profile($request) {
		$user = new User();
		$rsp = $user->profile($request);
		return View::render('admin/users/profile.twig', compact('rsp'));
	}

	public function saveProfile($request) {
		$user = new User();
        return $user->saveProfile($request);
	}

	public function changePassword($request) {
		$user = new User();
        return $user->changePassword($request);
	}

	public function authcms($request) {
		$user = new User();
		return $user->authcms($request);
	}
	
}

?>