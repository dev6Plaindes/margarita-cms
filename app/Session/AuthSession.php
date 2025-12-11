<?php

namespace App\Session;

use Illuminate\Database\Capsule\Manager as DB;

class AuthSession {

    public function getSession($name, $template_id) {
        $session = DB::table('sessions')->where('deleted_at')->where('template_id', $template_id)->where('name', $name)->first();
        if ($session) {
            $session->key = trim(strtolower($name.$session->id.$template_id));
        }
        return $session;
    }

    public function init($template_id = 0) {
        if ($template_id) {
            $name_session = 'login';
            $session = $this->getSession($name_session, $template_id);
            if (isset($_SESSION[$session->key])) {
                //$this->build();
                //var_dump($_SESSION[$session->key]);
            }
        }
    }

    public function build($name_session, $args) {
        $template_id = $args['template_id'];
        $session = $this->getSession($name_session, $template_id); 
        if ($session) {
            $data = [];
            $settings = json_decode($session->settings, true);
            switch (trim(strtolower($name_session))) {
                case 'login':
                    $user = $args['user'];
                    if ($user) {
                        $settings['user']['id'] = $user['id'];
                        $settings['user']['email'] = $user['email'];
                        $data = $settings;
                    }
                break;               
                default:
                    # code...
                break;
            }
            if (count($data)) {
                $_SESSION[$session->key] = $data;
            }
        }
    }

    public function destroy($name_session, $template_id) {
        $session = $this->getSession($name_session, $template_id);
        $response = ["success" => false, "data"=>$_SESSION[$session->key]];
        if ($session) {
            $response["success"] = true;
            unset($_SESSION[$session->key]);
        }
        return $response;
    }

}