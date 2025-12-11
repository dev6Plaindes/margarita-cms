<?php 

namespace Provider\comunidadpro\Dow;

use Illuminate\Database\Capsule\Manager as DB;
use Provider\comunidadpro\Utils\FG;
use Provider\comunidadpro\Service\AuthService;
use App\Session\AuthSession;
use App\Service\AuthSSOService;

class AuthDow {

    public function signin($request) {
		$rsp = FG::responseDefault();
        try {

            $input = $request->getParsedBody();
            $email = $input['email'];
            $password = $input['password'];

            if (!$email) {
                throw new \Exception('El campo email es requerido');
            }

            if (!$password) {
                throw new \Exception('El campo password es requerido');
            }

            $params = [
                'user' => $email,
                'password' => $password
            ];

            $authService = new AuthService();
            $result = $authService->post('/auth/login', $params);

            if (!$result['success']) {
                throw new \Exception($result['message']);
            }

            $data = $result['data'];
            $id = $data['id'];
            $name = $data['name'];
            $lastname = $data['lastname'];

            $user = [
                'id' => $id,
                'name' => $name,
                'email' => $email,
                'lastname' => $lastname,
                'profile' => 3
            ];
            
            $company = $request->getAttribute('att_company');

            $authssoService = new AuthSSOService();
            $result = $authssoService->onSignup([
                "userId" => $id,
                "userEmail" => $email
            ]);

            $auth = [];
            if ($result["success"]) {
                $data = $result["data"]["result"];
                if (count($data)) {
                    $auth = [
                        "browserAud" => $data["browserAud"],
                        "browserId" => $data["browserId"],
                        "browserIp" => $data["browserIp"],
                        "userEmail" => $data["email"],
                        "userId" => $data["id"],
                        "productId" => $data["productId"]
                    ];
                }
            }
            
            if ($company) {
                $template_id = $company['template_id'];
                $authSession = new AuthSession();
                $result = $authSession->build('login', compact('template_id', 'user', 'auth'));
            }

            $rsp['success'] = true;
            $rsp['message'] = 'Se logueo correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function signup($request) {
		$rsp = FG::responseDefault();
        try {

            $input = $request->getParsedBody();
            $email = $input['email'];
            $password = $input['password'];
            $mail = $input['mail'];

            if (!$email) {
                throw new \Exception('El campo email es requerido');
            }

            $params = [
                'name' => $email,
                'lastname' => $email,
                'lastnamemother' => '',
                'user' => $email,
                'password' => $password,
                'mail' => $mail
            ];

            $authService = new AuthService();
            $result = $authService->post('/user/registerUserExternal', $params);

            if (!$result['success']) {
                throw new \Exception($result['message']);
            }
            
            $rsp['success'] = true;
            $rsp['message'] = 'Se registro correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function signout($request) {
		$rsp = FG::responseDefault();
        try {

            $input = $request->getParsedBody();
            
            $company = $request->getAttribute('att_company');
            if ($company) {
                $template_id = $company['template_id'];
                $authSession = new AuthSession();

                $result = $authSession->destroy('login', $template_id);

                if ($result["success"]) {
                    $user = $result["data"]["user"];
                    $authssoService = new AuthSSOService();
                    $result = $authssoService->onSignout([
                        "userId" => $user["id"]
                    ]);
                }
            }
            
            $rsp['success'] = true;
            $rsp['message'] = 'La sesión se cerró correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

}