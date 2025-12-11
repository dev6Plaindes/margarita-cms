<?php 

namespace App\Model;

use App\Utilitarian\{FG};
use App\Model\{Menu, MenuSection, Company};
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;

class Landing {

	public function scheme($request) {
		$rsp = FG::responseDefault();
        try {
            $company_id = $_SESSION['COMPANY_ID'];
            $menus = Menu::where('deleted_at')->where('company_id', $company_id)->orderBy('order','ASC')->get();
            foreach ($menus as $k => $o) {
                $menus[$k]->sections = $o->sections;
                foreach ($menus[$k]->sections as $kk => $oo) {
                    $menus[$k]->sections[$kk]->contents = $oo->contents;
                }
            }
            $rsp['success'] = true;
            $rsp['data'] = compact('menus');
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

}

