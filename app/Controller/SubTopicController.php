<?php 

namespace App\Controller;

use App\Down\{SubTopicDown};

class SubTopicController extends BaseController
{
	public function save($request) {
		$down = new SubTopicDown();
        return $down->save($request);
	}

	public function remove($request) {
		$down = new SubTopicDown();
        return $down->remove($request);
	}
}

?>