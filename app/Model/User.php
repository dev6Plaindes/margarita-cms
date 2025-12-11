<?php 

namespace App\Model;

use App\Utilitarian\{Crypt, FG,  Mailer, Twig};
use App\Persistence\{utils};
use Firebase\JWT\JWT;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;

class User extends Model {

	protected $table = 'users';

    const MASTER_PROFILE = 1;
    const ADMIN_PROFILE = 2;

    public function profile($request) {
		$rsp = FG::responseDefault();
        try {
            $user = $_SESSION['USER'];
            $user = User::getUserById($user->id);
            $rsp['success'] = true;
            $rsp['data'] = compact('user');
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function saveProfile($request) {
		$rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());
            $user = $_SESSION['USER'];
            if (!is_object($user)) {
                throw new \Exception('El usuario no está logueado');
            }
            $user = User::getUserById($user->id);
            $user->name     = $name;
            $user->lastname = $lastname;
            $user->save();

            $_SESSION['USER'] = json_decode(json_encode($user->toArray()));
            
            $rsp['success'] = true;
            $rsp['message'] = 'Se guardo correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function changePassword($request) {
		$rsp = FG::responseDefault();
        try {
            
            extract($request->getParsedBody());
            $user = $_SESSION['USER'];
            
            if (!is_object($user)) {
                throw new \Exception('El usuario no está logueado');
            }

            if (strlen($password) < 4) {
                throw new \Exception('La contraseña debe ser mayor o igual a 4');
            }

            if ($password != $repeat) {
                throw new \Exception('Las contraseñas ingresadas deben ser las mismas');
            }

            $user = User::getUserById($user->id);
            $user->password = Crypt::encrypt($password);
            $user->save();

            $rsp['success'] = true;
            $rsp['message'] = 'Se guardo correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

	public function postlogin($request) {
		$rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());

			if (!$email) {
                throw new \Exception('El email es un campo obligatorio');
            }

			if (!$password) {
                throw new \Exception('El password es un campo obligatorio');
            }

			$user = User::where('deleted_at')->where('email', $email)->first();

			if (!$user) {
                throw new \Exception('El usuario no existe en la plataforma');
            }

			if ($password != Crypt::decrypt($user->password)) {
                throw new \Exception('Datos incorrectos');
            }

            $company = Company::where('url_codigo', FG::getDomain())->first();

            if (!$company){
                throw new \Exception('La empresa no existe');
            }

            $_SESSION['COMPANY_ID'] = $company->id;
			$_SESSION['USER'] = json_decode(json_encode($user->toArray()));

            $rsp['success'] = true;
            $rsp['data'] = '';
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function signout($request) {
		$rsp = FG::responseDefault();
        try {
			session_destroy();
            $rsp['success'] = true;
            $rsp['data'] = '';
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function registerUser($request) {
		$rsp = FG::responseDefault();
        
        try {
			$email = $_POST['email'];
			$password = $_POST['password'];
            $valid = Utils::validate_corrreo($email);
			if (!$email || !$valid) {
                throw new \Exception('The email is required');
            }

            if (!$password) {
                throw new \Exception('The password is required');
            }

			$user = User::where('deleted_at')->where('email', $email)->first();

			if (!$user) {  
                $user = new User();
                $user->email = $email;
                $user->folder = uniqid(time());
                $user->password = Crypt::encrypt($password);
                $user->save();

                $path = FG::fullFolderPath($user->folder);
                if (!is_dir($path)) {
                    mkdir($path, 0777,true);
                }
            }else{
                throw new \Exception('The user does exist on the platform. Sing in.');
            }
			
            $rsp['success'] = true;
            $rsp['data'] = json_decode($user);
            $rsp['message'] = 'Usuario registrado.';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function forgotPasswordUser($request) {
        $rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());

            if (!$email) {
                throw new \Exception('The email is required.');
            }

            $user = User::where('deleted_at')->where('email', $email)->first();
            if (!$user) {
                throw new \Exception('The user is not registered on the platform.');
            }

            $time = time();
            $key = getenv("TOKEN_KEY");
            $payload = array(
                'iat' => $time,
                'exp' => $time + 3600,
                'key' => $key,
                'email' => $email
            );
            $jwt = JWT::encode($payload, $key);
            
            $encrypt = Crypt::encrypt($send);
            $url = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]/recover-password/$jwt";

            $company = Company::with(['colors', 'logos'])->where('url_codigo', FG::getDomain())->first();
            if (!$company){
                throw new \Exception('La empresa no existe');
            }

            $mailer = new MailerFunction();
            $body = Twig::render('mail/recover.password.twig', compact('email', 'url', 'company'));
            $params = array('subject'=>'Recuperar Contraseña.', 'body' => "$body", 'recipients'=> array(), 'company' => $company);
            $recipients = array();
            array_push($recipients, array('email'=>$user->email, 'name'=>($user->lastname || $user->name ? ($user->name.' '.$o->lastname) : $user->email)));
            $params['recipients'] = $recipients;

            $result = $mailer->sendEmail($params);
            if (!$result['success']) {
                throw new \Exception('The email could not be sent.');
            }

            $rsp['success'] = true;
            $rsp['message'] = 'Se envío correctamente.';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
    }

    public function recoverPassword($request) {
        $rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());
            $code = end(explode("/", $request->getUri()->getpath()));
            $key = getenv("TOKEN_KEY");
            $decoded = JWT::decode($code, $key, array('HS256'));
            if (!isset($decoded->email)) {
                throw new \Exception('The email not exists.');
            }
            $email = $decoded->email;
            $user = User::where('deleted_at')->where('email', $email)->first();
            if (!$user) {
                throw new \Exception('The user is not registered on the platform.');
            }
            $url = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]"."$_SERVER[REQUEST_URI]";
            $rsp['success'] = true;
            $rsp['data'] = compact('url');
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
            header('Location: /'); exit();
        }
        return $rsp;
    }

    public function postRecoverPassword($request) {
        $rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());
            if (!$password) {
                throw new \Exception('The password is required.');
            }
            if (!$repeat_password) {
                throw new \Exception('The repeat_password is required.');
            }

            if ($password != $repeat_password) {
                throw new \Exception('The password and repeat_password are distinct.');
            }

            $code = end(explode("/", $request->getUri()->getpath()));
            $key = getenv("TOKEN_KEY");
            $decoded = JWT::decode($code, $key, array('HS256'));
            if (!isset($decoded->email)) {
                throw new \Exception('The email not exists.');
            }
            $email = $decoded->email;
            $user = User::where('deleted_at')->where('email', $email)->first();
            if (!$user) {
                throw new \Exception('The user is not registered on the platform.');
            }

            $user->password = Crypt::encrypt($password);
            $user->save();

            $rsp['success'] = true;
            $rsp['data'] = compact('url');
            $rsp['message'] = 'Se restableció correctamente su contraseña, ahora inicie sesión por favor';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
    }

    public static function getUserById($id) {
        return User::where('deleted_at')->where('id', $id)->first();
    }

    public function authcms($request) {
        try {
            $input = $request->getParsedBody();

            $email = $input['email'];
            $name = $input['name'] ? $input['name'] : 'Usuario';
            $lastname = $input['lastname'] ? $input['lastname'] : 'Administrador';
            $password = $input['password'] ? $input['password'] : FG::rand_string(6);
            $profile_id = $input['profile_id'] ? $input['profile_id'] : 2;

			if (!$email) {
                throw new \Exception('El email es un campo obligatorio');
            }

			$user = User::where('email', $email)->first();

			if (!$user) {
                $user = new User();
            }

            $user->email = $email;
            $user->password = Crypt::encrypt($password);
            $user->profile_id = $profile_id;
            $user->name = $name;
            $user->lastname = $lastname;
            $user->save();

            $company = Company::where('url_codigo', FG::getDomain())->first();

            if (!$company){
                throw new \Exception('La empresa no existe');
            }

            $_SESSION['COMPANY_ID'] = $company->id;
			$_SESSION['USER'] = json_decode(json_encode($user->toArray()));

            header('Location: /admin/landing/secciones');

        } catch (\Exception $e) {
            echo $e->getMessage();
        }
	}
}