<?php 

namespace App\Controller;

use App\Down\{InscriptionDown};

class InscriptionController extends BaseController
{
	public function manage($request) {
		$down = new InscriptionDown();
        return $down->manage($request);
	}
}

?>