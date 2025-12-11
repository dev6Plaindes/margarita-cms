<?php 

namespace Provider\comunidadpro\Controller;

use Provider\comunidadpro\Dow\AuthDow;

class AuthController {

	public function signin($request) {
		$dow = new AuthDow();
		return $dow->signin($request);
	}

    public function signup($request) {
		$dow = new AuthDow();
		return $dow->signup($request);
	}

	
    public function signout($request) {
		$dow = new AuthDow();
		return $dow->signout($request);
	}

}

?>