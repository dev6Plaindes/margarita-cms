<?php

namespace App\Middleware;
use App\Model\{Company};
use App\Utilitarian\{FG};
use \Firebase\JWT\JWT;

class Authenticate
{
    public static function init($route, $request) 
    {
        //self::Api($route, $request);
        self::Admin($route);
    }

    public static function Api($route, $request) 
    {
        if (array_shift(explode('.', $route->namePrefix)) == 'api') {
            $rsp = FG::responseDefault();
            try {
                $rsp['data'] = $auth = apache_request_headers()["Authorization"];
                $token = explode(" ", $auth)[1];
                $decoded = JWT::decode($token, $_ENV["API_SECRET_KEY"], array('HS256'));
                if ($decoded->key != $_ENV["API_ACCESS_KEY"]) {
                    throw new \Exception('wrong credentials');
                }
                $rsp['success'] = true;
                $rsp['data'] = compact('decoded');
            } catch (\Exception $e) {
                $rsp["message"]  = $e->getMessage();
            }
            if (!$rsp['success']) {
                echo json_encode($rsp); exit();
            }
        }
    }

    public static function Admin($route = [])
    {
        $array = explode('.', $route->name);
        if (array_shift($array) == 'admin') {
            $names = ['admin.login', 'admin.postlogin'];
            if (!(isset($_SESSION['USER']) && is_object($_SESSION['USER']))) {
                if (!(in_array($route->name, $names))) {
                    header('Location: /admin/login');
                }
            } else {
                if (!(isset($_SESSION['COMPANY_ID']) && is_numeric($_SESSION['COMPANY_ID']))) {
                    session_destroy();
                    header('Location: /admin/login');
                }
                if (in_array($route->name, $names)) {
                    header('Location: /admin');
                }
            }
        }
    }

    public static function CompanyData()
    {
        $companyObj = new Company();
        $url_codigo = str_replace("www.","",$_SERVER['HTTP_HOST']);
		$companie = $companyObj->getCompanyByUrl($url_codigo);
        $GLOBALS['COMPANY'] = $companie;
        FG::setCompany($companie);
        return $companie;
    }
}
