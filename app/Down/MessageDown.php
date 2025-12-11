<?php 

namespace App\Down;

use App\Utilitarian\{FG, Mailer, Twig};
use App\Model\{Message, Template};

class MessageDown {

    public function list($request) {
		$rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());
            $company_id = $_SESSION['COMPANY_ID'];
            $messages = Message::where('deleted_at')->where('company_id', $company_id)->get();
            $subscriptions = array();
            $contacts = array();
            $items = array();
            foreach ($messages as $key => $item) {
                switch ($item->type_id) {
                    case Message::CONTACT_TYPE:
                        $contacts[] = $item;
                    break;
                    case Message::SUBSCRIPTION_TYPE:
                        $subscriptions[] = $item;
                    break;    
                    case Message::MESSAGE_TYPE:
                        $items[] = $item;
                    break;    
                    default:
                        # code...
                    break;
                }
            }
            
            $rsp['success'] = true;
            $rsp['data'] = compact('subscriptions', 'contacts', 'items', 'company_id');
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function addSubscription($request)
    {
        $rsp = FG::responseDefault();
        try {
            $company = $request->getAttribute('att_company');
            extract($request->getParsedBody());
            $company_id = $company["id"];
            $mail = null;
            $template_id = $company['template_id'];
            $template = Template::where('id', $template_id)->first();

            switch ($template->codigo) {
                case 'comunidad':
                    $messages = Message::where('deleted_at')
                                        ->where('company_id', $company_id)
                                        ->where('type_id',Message::SUBSCRIPTION_TYPE)
                                        ->where('email',$email)
                                        ->first();
                    if(!$messages){
                        $obj_message = new Message();
                        $obj_message->email = $email;
                        $obj_message->company_id = $company_id;
                        $obj_message->type_id = Message::SUBSCRIPTION_TYPE;
                        $obj_message->save();
                    }
                    $mailer = new Mailer();
                    $host = "https://".$_SERVER['HTTP_HOST'];
                    $body = Twig::render('mail/comunidad/contact.twig', compact('host', 'company'));
                    $params = array('subject'=>'Notificación de Contacto.', 'body' => "$body", 'recipients'=> array(['email'=>$email]), 'company' => $company);            
                    
                    //$recipients = array('email'=> $company['email_contact'], 'name'=> $company['name']);
                    //$params['recipients'][] = $recipients;
                    $mail = $mailer->sendEmail($params);
                    $rsp['data']['mail'] = $mail;
                    // if (!$mail['success']) {
                    //     throw new \Exception($mail['message']);
                    // }
                    $rsp['data'] = compact('message', 'mail');
                    $rsp['message'] = 'Se envio correctamente';
                break;
                
                default:
                    /*$messages = Message::where('deleted_at')
                                ->where('company_id', $company_id)
                                ->where('type_id',Message::SUBSCRIPTION_TYPE)
                                ->where('phone',$telephone)
                                ->where('email',$email)
                                ->first();
                    if(!$messages){*/
                        $message = new Message();
                        $message->phone = $telephone;
                        $message->email = $email;
                        $message->company_id = $company_id;
                        $message->type_id = Message::SUBSCRIPTION_TYPE;
                        $message->save();
                        $senderemail = $company['email_contact'];
                        if ($senderemail) {
                        // if ($company['send_email'] == 1) {
                            $mailer = new Mailer();
                            $host = "https://".$_SERVER['HTTP_HOST'];
                            $body = Twig::render('mail/subscription.twig', compact('host', 'company', 'message'));
                            $params = array('subject'=>'Notificación de Suscripción.', 'body' => "$body", 'recipients'=> array(['email'=>$senderemail]), 'company' => $company);
                            $mail = $mailer->sendEmail($params);
                        // }
                        }
                    //}
                    $rsp['data'] = compact('message', 'mail');
                    $rsp['message'] = 'Se ha suscrito';
                break;
            }
            
            $rsp['success'] = true;
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
    }

    public function addMessage($request)
    {
        $rsp = FG::responseDefault();
        try {
            $company = $request->getAttribute('att_company');
            extract($request->getParsedBody());
            $company_id = $company["id"];
            $obj_message = new Message();
            $obj_message->name = $name;
            $obj_message->email = $email;
            $obj_message->description = $message;
            $obj_message->phone = $phone;
            $obj_message->company_id = $company_id;
            $obj_message->type_id = Message::CONTACT_TYPE;
            $obj_message->save();
            
            $rsp['data'] = compact('message');
            $rsp['message'] = 'Se registro correctamente';

            if (@$company['template_codigo'] == 'comunidadpro') {
                $mail = [
                    'logo' => count($company['logos']) ? $company['host'].$company['logos'][0]['patch'] : '',
                    'color' => count($company['colors']) ? $company['colors'][0]['color'] : '',
                    'host' => $company['host']
                ];
                $authDow = new \Provider\comunidadpro\Dow\AuthDow();
                $input = $request->getParsedBody();
                $input['password'] = FG::rand_string(8);
                $input['mail'] = json_encode($mail);
                $request = $request->withParsedBody($input);
                $result = $authDow->signup($request);
                if (!$result['success']) {
                    throw new \Exception($result['message']);
                }
                $rsp['data']['mail'] = $result;
                $rsp['message'] = 'Hemos enviado tus credenciales a tu correo electrónico';
            }

            $rsp['success'] = true;
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
    }

    public function addMessageContact($request)
    {
        $rsp = FG::responseDefault();
        try {
            $company = $request->getAttribute('att_company');  
            extract($request->getParsedBody());
            $company_id = $company["id"];
            $message = new Message();
            $message->name = $name;
            $message->email = $email;
            $message->description = $description;
            $message->phone = $telephone;
            $message->company_id = $company_id;
            $message->type_id = Message::CONTACT_TYPE;
            $message->save();

            $mailer = new Mailer();
            $body = Twig::render('mail/contact.twig', compact('name', 'email', 'telephone', 'description', 'company'));
            $params = array('subject'=>'Notificación de Contacto.', 'body' => "$body", 'recipients'=> array(), 'company' => $company);            
            
            $recipients = array('email'=> $company['email_contact'], 'name'=> $company['name']);
            $params['recipients'][] = $recipients;
            $mail = $mailer->sendEmail($params);        
            
            $rsp['success'] = true;
            $rsp['data'] = compact('message');
            $rsp['message'] = 'Gracias por escribirnos. Un representante de Sofdtynamic se contactará con usted en la brevedad posible';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
    }

    public function addMessageContact_cl($request)
    {
        $rsp = FG::responseDefault();
        try {
            $company = $request->getAttribute('att_company');  
            extract($request->getParsedBody());
            $company_id = $company["id"];
            $message = new Message();
            $message->name = $name;
            $message->asunto = $asunto;
            $message->email = $email;
            $message->description = $description;
            $message->phone = $telephone;
            $message->company_id = $company_id;
            $message->type_id = Message::CONTACT_TYPE;
            $message->save();

            $mailer = new Mailer();
            $body = Twig::render('mail/contact.twig', compact('name', 'email', 'telephone', 'description', 'company'));
            $params = array('subject'=>'Notificación de Contacto.', 'body' => "$body", 'recipients'=> array(), 'company' => $company);            
            
            $recipients = array('email'=> $company['email_contact'], 'name'=> $company['name']);
            $params['recipients'][] = $recipients;
            $mail = $mailer->sendEmail($params);        
            
            $rsp['success'] = true;
            $rsp['data'] =  $mail ;
            $rsp['message'] = 'Gracias por escribirnos. Un representante de Sofdtynamic se contactará con usted en la brevedad posible';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
    }

    public function newMessage($request)
    {
        $rsp = FG::responseDefault();
        try {
            $company = $request->getAttribute('att_company');
            extract($request->getParsedBody());
            $company_id = $company["id"];
            $mail = null;

            $message = new Message();
            $message->email = $email;
            $message->description = $description;
            $message->company_id = $company_id;
            $message->type_id = Message::MESSAGE_TYPE;
            $message->save();

            $senderemail = $company['email_contact'];
            if ($senderemail) {
            // if ($company['send_email'] == 1) {
                $mailer = new Mailer();
                $host = "https://".$_SERVER['HTTP_HOST'];
                $body = Twig::render('mail/message.twig', compact('host', 'company', 'message'));
                $params = array('subject'=>'Notificación.', 'body' => "$body", 'recipients'=> array(['email'=>$senderemail]), 'company' => $company);
                $mail = $mailer->sendEmail($params);
            // }
            }
                    
            $rsp['data'] = compact('mail');
            $rsp['message'] = 'Se ha enviado correctamente';
            $rsp['success'] = true;
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
    }

}