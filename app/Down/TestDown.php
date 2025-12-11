<?php 

namespace App\Down;

use App\Utilitarian\{FG};
use App\Persistence\{ Mongodb };

class TestDown {

    public function users($request) {
		$rsp = FG::responseDefault();
        try {

            $mongodb = new Mongodb();

            $cnn = $mongodb->ConnectionUrl();
            $users = $cnn->users->find()->toArray();

            $rsp['success'] = true;
            $rsp['data'] = compact('users');
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}
}