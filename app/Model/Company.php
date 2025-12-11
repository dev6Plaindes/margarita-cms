<?php 

namespace App\Model;

use App\Utilitarian\{FG};
use App\Model\{Transfer, CompanyColor, Template};
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;

class Company extends Model {

	protected $table = 'companies';

    public function getCompanyCurrent($request) {
		$rsp = FG::responseDefault();
        try {
            $company_id = $_SESSION['COMPANY_ID'];
            $company = Company::getCompanyById($company_id);
            $colors = $company->colors;
            $logos = $company->logos;
            $rsp['success'] = true;
            $rsp['data'] = compact('company', 'colors', 'logos');
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function saveData($request) {
		$rsp = FG::responseDefault();
        try {
            
            extract($request->getParsedBody());
            
            if (!is_numeric($company_id)){
                throw new \Exception('El parametro company_id es obligatorio');
            }
            
            $company                        = Company::where('id', $company_id)->where('deleted_at')->first();
            $company->name                  = $name;
            $company->ruc                   = $ruc;
            $company->address               = $address;
            $company->description           = $description;
            $company->phone_contact         = $phone_contact;
            $company->email_contact         = $email_contact;
            $company->terms_and_conditions  = $terms_and_conditions;
            $company->privacy_policies      = $privacy_policies;
            $company->preguntas_frecuentes  = $preguntas_frecuentes;
            $company->mailer_host           = $mailer_host;
            $company->mailer_username       = $mailer_username;
            $company->mailer_password       = $mailer_password;
            $company->mailer_name           = $mailer_name;
            $company->vision                = $vision;
            $company->mision                = $mision;

            $company->save();

            $rsp['success'] = true;
            $rsp['data'] = compact('company');
            $rsp['message'] = 'Se guardo correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function saveInterface($request) {
		$rsp = FG::responseDefault();
        try {
            
            extract($request->getParsedBody());
            
            if (!is_numeric($company_id)){
                throw new \Exception('El parametro company_id es obligatorio');
            }

            if (!$panel){
                throw new \Exception('El parametro panel es obligatorio');
            }

            $company = Company::where('id', $company_id)->where('deleted_at')->first();

            switch ($panel) {
                case 'general':

                    $company->meta_title      = $meta_title;

                    $upload = $request->getUploadedFiles();
                    $baseurl = "upload/company/";
                    $fullpath = __DIR__."/../../public/".$baseurl;
                    if (!is_dir($fullpath)) {
                        mkdir($fullpath, 0777,true);
                    }

                    $file = $upload['favicon'];
                    if ($file->getError() == UPLOAD_ERR_OK) {
                        $uniqid = uniqid(time());
                        $fileName = strtolower($file->getClientFilename());
                        $path = $baseurl."$uniqid-$fileName";
                        $file->moveTo($path);
                        unlink(__DIR__."/../../public/".$company->favicon);
                        $company->favicon = "/$path";
                    }
                    $company->save();

                break;
                case 'redes':

                    $company->facebook_link  = $facebook_link;
                    $company->linkedin_link  = $linkedin_link;
                    $company->instagram_link = $instagram_link;
                    $company->whatsapp_link  = $whatsapp_link;
                    $company->twitter_link   = $twitter_link;
                    $company->save();

                break;
                case 'plugins':
                    # code...
                    $company->facebook_script  = $facebook_script;
                    $company->tawkto_script   = $tawkto_script;
                    $company->save();
                break;
                case 'colors':
                    $color_ids = array();
                    if (count($colors) > 0) {
                        foreach ($colors as $k => $o) {
                            $color = is_numeric($o['id']) ? CompanyColor::where('id', $o['id'])->first() : new CompanyColor();
                            $color->color = $o['color'];
                            $color->company_id = $company_id;
                            $color->save();
                            array_push($color_ids, $color->id);
                        }
                    }
                    $exists = CompanyColor::where('company_id', $company_id)->where('deleted_at')->get();
                    foreach ($exists as $k => $o) {
                        if (!in_array($o->id, $color_ids)) {
                            $o->deleted_at = FG::getDateHour();
                            $o->save();
                        }
                    }
                break;
                case 'logos':
                    $baseurl = "upload/logos/";
                    $basepath = __DIR__."/../../public/";
                    $fullpath = $basepath.$baseurl;
                    if (!is_dir($fullpath)) {
                        mkdir($fullpath, 0777,true);
                    }

                    $uploads = $request->getUploadedFiles();
                    $logo_ids = array();
                    foreach ($logos as $k => $o) {
                        $logo = is_numeric($o['id']) ? CompanyLogo::where('id', $o['id'])->where('deleted_at')->first() : new CompanyLogo();
                        $logo->company_id = $company_id;
                        if (count($uploads) > 0) {
                            $file = $uploads['logos'][$k]['logo'];
                            if ($file->getError() == UPLOAD_ERR_OK) {
                                $uniqid = uniqid(time());
                                $fileName = strtolower($file->getClientFilename());
                                $path = $baseurl."$uniqid-$fileName";
                                $file->moveTo($path);
                                unlink($basepath.$logo->logo);
                                $logo->logo = "/$path";
                                $logo->save();
                            }
                        }
                        array_push($logo_ids, $logo->id);
                    }

                    $exists = CompanyLogo::where('company_id', $company_id)->where('deleted_at')->get();
                    if (count($exists) > 0) {
                        foreach ($exists as $k => $o) {
                            if (!in_array($o->id, $logo_ids)) {
                                $o->deleted_at = FG::getDateHour();
                                $o->save();
                                unlink($basepath.$o->logo);
                            }
                        }    
                    }
                break;
            }

            $rsp['success'] = true;
            $rsp['message'] = 'Se guardo correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function payment($request) {
		$rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());            
            $company_id = $_SESSION['COMPANY_ID'];
            $company = Company::getCompanyById($company_id);
            $transfers = $company->transfers;
            $mobiles = array(); $banks = array();

            foreach ($transfers as $k => $o) {
                if (!$o->deleted_at) {
                    if ($o->type_id == Transfer::TYPE_BANK) {
                        array_push($banks, $o);
                    } else if ($o->type_id == Transfer::TYPE_MOBILE){
                        array_push($mobiles, $o);
                    }    
                }
            }

            $rsp['success'] = true;
            $rsp['data'] = compact('company', 'banks', 'mobiles');            
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function savePayment($request) {
		$rsp = FG::responseDefault();
        try {
            
            extract($request->getParsedBody());
            
            if (!is_numeric($company_id)){
                throw new \Exception('El parametro id es obligatorio');
            }

            if (!$panel){
                throw new \Exception('El parametro panel es obligatorio');
            }

            $company = Company::where('id', $company_id)->where('deleted_at')->first();
            if (!$company){
                throw new \Exception('No se encontró la empresa');
            }

            $baseurl = "upload/payment/";
            $basepath = __DIR__."/../../public/";
            $fullpath = $basepath.$baseurl;
            if (!is_dir($fullpath)) {
                mkdir($fullpath, 0777,true);
            }

            switch ($panel) {
                case 'transfer-bank':
                    $uploads = $request->getUploadedFiles();
                    $bank_ids = array();
                    foreach ($bank as $k => $o) {
                        $transfer = is_numeric($o['id']) ? Transfer::where('id', $o['id'])->where('deleted_at')->first() : new Transfer();
                        $transfer->account = $o['account'];
                        $transfer->number = $o['number'];
                        $transfer->cci = $o['cci'];
                        $transfer->type_id = Transfer::TYPE_BANK;
                        $transfer->company_id = $company_id;
                        if (count($uploads) > 0) {
                            $file = $uploads['bank'][$k]['image'];
                            if ($file->getError() == UPLOAD_ERR_OK) {
                                $uniqid = uniqid(time());
                                $fileName = strtolower($file->getClientFilename());
                                $path = $baseurl."$uniqid-$fileName";
                                $file->moveTo($path);
                                unlink($basepath.$transfer->image);
                                $transfer->image = "/$path";
                            }
                        }
                        $transfer->save();
                        array_push($bank_ids, $transfer->id);
                    }
                    $transfers = Transfer::where('company_id', $company_id)->where('type_id', Transfer::TYPE_BANK)->where('deleted_at')->get();
                    foreach ($transfers as $k => $o) {
                        if (!in_array($o->id, $bank_ids)) {
                            $o->deleted_at = FG::getDateHour();
                            $o->save();
                            unlink($basepath.$o->image);
                        }
                    }
                break;
                case 'transfer-mobile':
                    $uploads = $request->getUploadedFiles();
                    $mobile_ids = array();
                    foreach ($mobile as $k => $o) {
                        $transfer = is_numeric($o['id']) ? Transfer::where('id', $o['id'])->where('deleted_at')->first() : new Transfer();
                        $transfer->account = $o['account'];
                        $transfer->number = $o['number'];
                        $transfer->type_id = Transfer::TYPE_MOBILE;
                        $transfer->company_id = $company_id;
                        if (count($uploads) > 0) {
                            $file = $uploads['mobile'][$k]['image'];
                            if ($file->getError() == UPLOAD_ERR_OK) {
                                $uniqid = uniqid(time());
                                $fileName = strtolower($file->getClientFilename());
                                $path = $baseurl."$uniqid-$fileName";
                                $file->moveTo($path);
                                unlink($basepath.$transfer->image);
                                $transfer->image = "/$path";
                            }
                        }
                        $transfer->save();
                        array_push($mobile_ids, $transfer->id);
                    }
                    $transfers = Transfer::where('company_id', $company_id)->where('type_id', Transfer::TYPE_MOBILE)->where('deleted_at')->get();
                    foreach ($transfers as $k => $o) {
                        if (!in_array($o->id, $mobile_ids)) {
                            $o->deleted_at = FG::getDateHour();
                            $o->save();
                            unlink($basepath.$o->image);
                        }
                    }
                break;
            }

            $rsp['success'] = true;
            $rsp['message'] = 'Se guardo correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public static function getCompanyById($id) {
        return Company::where('deleted_at')->where('id', $id)->first();
    }

    public function colors() {
        return $this->hasMany(CompanyColor::class);
    }

    public function logos() {
        return $this->hasMany(CompanyLogo::class);
    }

    public function transfers() {
        return $this->hasMany(Transfer::class);
    }

    public function template() {
		return $this->belongsTo(Template::class, 'template_id', 'id'); 
	}

    public function getCompanyByUrl($url) {
        $domain = $_ENV['APP_DOMAIN'];
        $contents_sql = Capsule::table('companies')
				->join('templates', 'templates.id', '=', 'companies.template_id')
                ->leftJoin('companies_logos', 'companies_logos.company_id','=','companies.id')
                ->leftJoin('companies_colors', 'companies_colors.company_id','=','companies.id')
				->select('templates.codigo as template_codigo','companies.id as id','companies.name as name','companies.url_codigo as url_codigo','companies.description as description',
                        'companies.privacy_policies as privacy_policies','companies.terms_and_conditions as terms_and_conditions','companies.whatsapp_link as whatsapp_link','companies.preguntas_frecuentes as preguntas_frecuentes',
                        'companies.facebook_link as facebook_link','companies.twitter_link as twitter_link','companies.linkedin_link as linkedin_link',
                        'companies.instagram_link as instagram_link','companies.email_contact as email_contact','companies.phone_contact as phone_contact',
                        'companies_logos.logo as logo','companies_logos.id as logo_id',
                        'companies_colors.color as color', 'companies_colors.id as color_id','companies_colors.alias as color_alias',
                        'companies.meta_title as meta_title','companies.favicon as favicon','companies.address as address',
                        'companies.vision as vision', 'companies.mision as mision',
                        'companies.longitude_maps as longitude_maps', 
                        'companies.latitude_maps as latitude_maps',
                        'companies.settings as settings',
                        'companies.template_id as template_id',
                        'companies.mailer_host',
                        'companies.mailer_username',
                        'companies.mailer_password',
                        'companies.mailer_name',
                        'companies.admin',
                        'companies.send_email',
                        'companies.facebook_script as facebook_script',
                        'companies.tawkto_script as tawkto_script'
                        )
				->where('templates.deleted_at')
				->where('companies_logos.deleted_at')
				->where('companies_colors.deleted_at')
				->where('companies.url_codigo','=',$url)
				->get();
        
        $contents_sql = $contents_sql->toArray();
        $contents = array();
        $logos = array();
        $logo_aux = array();
        $colors = array();
        $color_aux = array();
        
        foreach ($contents_sql as $key => $value) {
            $settings = $value->settings ? json_decode($value->settings, true) : [];
            if (!isset($settings['aside'])) {
                $settings['aside'] = FG::getSettingsCompanyDefault()['aside'];
            }
            $content = array("id" => $value->id,
                            "template_codigo" => $value->template_codigo,
                            "name" => $value->name,
                            "host" => (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://" . $domain,
                            "url_codigo" => $value->url_codigo,
                            "description" => $value->description,
                            "privacy_policies" => $value->privacy_policies,
                            "terms_and_conditions" => $value->terms_and_conditions,
                            "preguntas_frecuentes" => $value->preguntas_frecuentes,
                            "whatsapp_link" => $value->whatsapp_link,
                            "facebook_link" => $value->facebook_link,
                            "twitter_link" => $value->twitter_link,
                            "linkedin_link" => $value->linkedin_link,
                            "instagram_link" => $value->instagram_link,
                            "latitude_maps" => $value->latitude_maps,
                            "longitude_maps" => $value->longitude_maps,
                            "address" => $value->address,
                            "email_contact" => $value->email_contact,
                            "phone_contact" => $value->phone_contact,
                            "favicon" => $value->favicon,
                            "meta_title" => $value->meta_title,
                            "mision" => $value->mision,
                            "vision" => $value->vision,
                            "settings" => $settings,
                            "template_id" => $value->template_id,

                            "mailer_host" => $value->mailer_host,
                            "mailer_username" => $value->mailer_username,
                            "mailer_password" => $value->mailer_password,
                            "mailer_name" => $value->mailer_name,
                            "admin" => $value->admin,
                            "send_email" => $value->send_email,
                            "facebook_script" => $value->facebook_script,
                            "tawkto_script" => $value->tawkto_script
            );
            if ( $value->logo_id) {
                if (!in_array($value->logo_id,$logo_aux)) {
                    $logos[] = array("id" => $value->logo_id,
                    "companie_id" => $value->id,
                    "patch" => $value->logo
                    );
                    $logo_aux[] =  $value->logo_id;
                }
            }

            if ( $value->color_id) {
                if (!in_array($value->color_id,$color_aux)) {
                    $colors[] = array("id" => $value->color_id,
                                    "companie_id" => $value->id,                                    
                                    "color" => $value->color,
                                    "alias" => $value->color_alias,
                                    ); 
                    $color_aux[] =  $value->color_id;
                }
                
            }

            $aux = false;
            unset($contents_sql[$key]);
            foreach ($contents as $key_c => $value_c) {
                if ($value->id == $value_c["id"]) {
                    $aux = true;
                }
            }
            if (!$aux) {
                $contents[] = $content;
            }
        }

        foreach ($contents as $key => $value) {
            foreach ($logos as $i => $value_i) {
                if ($value["id"] == $value_i["companie_id"]) {
                    $contents[$key]["logos"][] = $value_i;
                }
            }
            foreach ($colors as $i => $value_i) {
                if ($value["id"] == $value_i["companie_id"]) {
                    $contents[$key]["colors"][] = $value_i;
                }
            }
        }
        return $contents[0];
    }
}