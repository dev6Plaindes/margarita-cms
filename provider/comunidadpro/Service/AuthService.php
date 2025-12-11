<?php 

namespace Provider\comunidadpro\Service;

use Firebase\JWT\JWT;
use Curl;

class AuthService {

    public function getUrl() {
        return $_ENV['API_AUTH_URL'];
    }

    public function getAccessKey() {
        return $_ENV['API_AUTH_ACCESS_KEY'];
    }

    public function getSecrectKey() {
        return $_ENV['API_AUTH_SECRET_KEY'];
    }

    public function getToken($time = 120) {
        $token = array(
            'iat' =>  time(),
            'exp' =>  time() + $time,
            'key' =>  $this->getAccessKey()
        );
        $jwt = JWT::encode($token, $this->getSecrectKey());
        return $jwt;
    }

    public function post($uri, $args = []) {
        $token = $this->getToken();
        $curl = new Curl\Curl();
        $resp = array();
        $url =  $this->getUrl() . $uri;
        $curl->setOpt(CURLOPT_HTTPHEADER, array("Authorization: Bearer " . $token));
        $data = $curl->post($url, $args);
        $response = json_decode($data->response, true);
        if (!$curl->error) {
            $data = $response;
        } else {
            $data["success"] = false;
            $data["message"] = "Servicio no disponible";
        }
        return $data;
    }

}