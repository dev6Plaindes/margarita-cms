<?php 

namespace App\Down;

use App\Utilitarian\{FG, Mailer, Twig};
use App\Model\{ Company, Inscription };
use App\Down\{ CompanyDown };

class InscriptionDown {

	public function manage($request) {
		$rsp = FG::responseDefault();
        try {
            $param = $request->getParsedBody();
            if(!$param['id']){
                throw new \Exception('El campo id es obligatorio');
            }

            $inscription = Inscription::where('id', $param['id'])->first();
            if(!$inscription){
                throw new \Exception('No se logró encontrar la inscripción');
            }

            $company = Company::with(['colors', 'logos'])->where('id', $inscription->company_id)->first();
            if(!$company){
                throw new \Exception('No se logró encontrar la empresa');
            }
        
            if (@$param['send']) {
                $mailer = new Mailer();
                $comment = $param['comment'];
                $email = $inscription->email;
                $name = $inscription->name;
                $body = Twig::render('mail/payment.twig', compact('name', 'email', 'comment', 'company'));
                $params = array('subject'=>'Notificación de Transacción.', 'body' => "$body", 'recipients'=> array(), 'company' => $company);
                $recipients = array('email'=>$email, 'name'=>$name);
                $params['recipients'][] = $recipients;
                $mail = $mailer->sendEmail($params);
            }
            
            $inscription->status = $param['status'];
            $inscription->save();
            
            $down = new CompanyDown();
            $dashboard = $down->dashboard(null)['data'];
            $rsp['success'] = true;
            $rsp['data'] = compact('dashboard', 'mail');
            $rsp['message'] = 'Se guardo correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}
}