<?php 

namespace App\Controller;

use App\Down\{TopicpDown};

class TopicpController extends BaseController
{
	public function save($request) {
		$down = new TopicpDown();
        return $down->save($request);
	}

	public function remove($request) {
		$down = new TopicpDown();
        return $down->remove($request);
	}
}

?>