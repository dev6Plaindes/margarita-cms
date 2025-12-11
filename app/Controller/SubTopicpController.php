<?php 

namespace App\Controller;

use App\Down\{SubTopicpDown};

class SubTopicpController extends BaseController
{
	public function save($request) {
		$down = new SubTopicpDown();
        return $down->save($request);
	}

	public function remove($request) {
		$down = new SubTopicpDown();
        return $down->remove($request);
	}
}

?>