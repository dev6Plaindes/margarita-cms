<?php 

namespace App\Service;

use App\Utilitarian\FG;
use App\Session\AuthSession;
use Illuminate\Database\Capsule\Manager as DB;
use Firebase\JWT\JWT;
use Curl;

class AuthSSOService {

    public function getUrl() {
        return $_ENV['API_AUTH_SSO_URL'];
    }

    public function getAccessKey() {
        return $_ENV['API_AUTH_SSO_ACCESS_KEY'];
    }

    public function getSecrectKey() {
        return $_ENV['API_AUTH_SSO_SECRET_KEY'];
    }

    public function getNameKey() {
        return $_ENV['API_AUTH_SSO_NAME'];
    }

    public function getToken($time = 120) {
        $token = array(
            'iat' =>  time(),
            'exp' =>  time() + $time,
            'accessKey' =>  $this->getAccessKey()
        );
        $jwt = JWT::encode($token, $this->getSecrectKey());
        return $jwt;
    }

    public function post($uri, $args = []) {
        $resp = array("success"=>false,"message"=>"","data"=>"");
        try {
            $curl = new Curl\Curl();
            $url =  $this->getUrl() . $uri;
            $token = $this->getToken();
            $curl->setHeader('Content-Type', 'application/json');
            $curl->setHeader('Accept', 'application/json');
            $curl->setHeader('Authorization', 'Bearer ' . $token);

            $encodedData = json_encode($args);
            $curl->setHeader('Content-Length', strlen($encodedData));
            
            $data = $curl->post($url, $encodedData);
            if (!$data->error) {
                $respuesta = json_decode(trim($data->response), true);
                if (!$respuesta['success']) {
                    throw new \Exception("The API response is not a json type.");
                }
                $resp['data']  = $respuesta['data'];
                $resp['success'] = true;
                $resp['message'] = $respuesta['message'];;
            } else {
                throw new \Exception("An error ocurred while connecting url API {$url}");
            }
        } catch (\Exception $e) {
            $resp['message'] = $e->getMessage();
        }
        return $resp;
    }

    public function getValues($args) {
        $values = [
            "browserId" => sha1(@$_SERVER['HTTP_USER_AGENT']),
            "browserIp" => sha1(FG::getRealIP()),
            "browserAud" => FG::getAud(),
            "productId" => $this->getNameKey()
        ];
        return array_merge($args, $values);
    }

	public function onInit($company = []) {
        if (count($company)) {
            $template_id = $company['template_id'];
            $authSession = new AuthSession();
            $session = $authSession->getSession('login', $template_id);
            if ($session) {
                $result = $this->onSignin();
                if ($result['success']) {
                    $data = $result['data']['user'];
                    $user = [
                        'id' => $data['id'],
                        'email' => $data['email'],
                        'profile' => 3
                    ];
                    $authSession->build('login', compact('template_id', 'user'));
                } else {
                    unset($_SESSION[$session->key]);
                }
            }
        }
	}

    public function onSignin($args = []) {
        return $this->post('/users/token', $this->getValues($args));
	}

    public function onSignup($args) {
        return $this->post('/users/register', $this->getValues($args));        
	}

    public function onSignout($args = []) {
        return $this->post('/users/signout', $args);
	}

}
