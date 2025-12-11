<?php 

namespace App\Controller;

use App\Down\{TopicDown};

class TopicController extends BaseController
{
	public function save($request) {
		$down = new TopicDown();
        return $down->save($request);
	}

	public function remove($request) {
		$down = new TopicDown();
        return $down->remove($request);
	}
}

?>