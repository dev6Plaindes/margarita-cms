<?php 

namespace App\Down;

use App\Utilitarian\{FG};
use App\Model\{Transfer, Product, Characteristic, Inscription};

class PaymentDown {

    public function viewPurchaseProduct($request) {
		$rsp = FG::responseDefault();
        try {
            $company = $request->getAttribute('att_company');
            $slug = $request->getAttribute('slug');
            $product = Product::where('status', 1)->where('slug', $slug)->first();
            if (!$product) {
                header ("Location: /");
            }
            $transfers = Transfer::where('company_id', $company['id'])->get();
            $banks = array(); $mobiles = array();
            foreach ($transfers as $key => $item) {
                if ($item->type_id == Transfer::TYPE_BANK) {
                    array_push($banks, $item);
                } else if ($item->type_id == Transfer::TYPE_MOBILE) {
                    array_push($mobiles, $item);
                }         
            }
            $characteristics = Characteristic::with(['design_icon'])->where('product_id', $product->id)->get();
            $inscription = new Inscription();

            $rsp['data'] = compact('mobiles', 'banks', 'product', 'characteristics', 'inscription');
            $rsp['success'] = true;
            $rsp['message'] = 'Successfly';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function viewPurchaseCode($request) {
		$rsp = FG::responseDefault();
        try {
            $company = $request->getAttribute('att_company');
            $code = $request->getAttribute('code');
            $inscription = Inscription::where('code', $code)->first();
            if (!$inscription) {
                header ("Location: /");
            }
            $product = Product::where('status', 1)->where('id', $inscription->product_id)->first();
            if (!$product) {
                header ("Location: /");
            }
            $transfers = Transfer::where('company_id', $company['id'])->get();
            $banks = array(); $mobiles = array();
            foreach ($transfers as $key => $item) {
                if ($item->type_id == Transfer::TYPE_BANK) {
                    array_push($banks, $item);
                } else if ($item->type_id == Transfer::TYPE_MOBILE) {
                    array_push($mobiles, $item);
                }         
            }
            $characteristics = Characteristic::with(['design_icon'])->where('product_id', $product->id)->get();
            $rsp['data'] = compact('mobiles', 'banks', 'product', 'characteristics', 'inscription');
            $rsp['success'] = true;
            $rsp['message'] = 'Successfly';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function purchaseCode($request) {
		$rsp = FG::responseDefault();
        try {
            $params = $request->getParsedBody();
            $company = $request->getAttribute('att_company');
            $code = $request->getAttribute('code');
            $inscription = Inscription::where('code', $code)->first();
            $upload = $request->getUploadedFiles();
            $baseurl = "upload/voucher/";
            $fullpath = __DIR__."/../../public/".$baseurl;
            if (!is_dir($fullpath)) {
                mkdir($fullpath, 0777,true);
            }
            $file = $upload['file'];
            if ($file->getError() == UPLOAD_ERR_OK) {
                $uniqid = uniqid(time());
                $fileName = strtolower($file->getClientFilename());
                $path = $baseurl."$uniqid-$fileName";
                $file->moveTo($path);
                unlink(__DIR__."/../../public/".$inscription->file);
                $inscription->file = "/$path";
                $inscription->status = Inscription::ENVIADO;
            }
            $inscription->comment = $params['comment'];
            $inscription->save();

            $code = $inscription->code;

            $rsp['data'] = compact('code');
            $rsp['success'] = true;
            $rsp['message'] = 'Se registro correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function purchaseProduct($request) {
		$rsp = FG::responseDefault();
        try {
            $params = $request->getParsedBody();
            $company = $request->getAttribute('att_company');
            $slug = $request->getAttribute('slug');
            $product = Product::where('status', 1)->where('slug', $slug)->first();
            if (!$product) {
                throw new \Exception('El curso no existe');
            }

            $inscription = new Inscription();
            $inscription->product_id = $product->id;
            $inscription->email = $params['email'];
            $inscription->code = strtoupper(FG::rand_string(3).uniqid(time()));
            $inscription->name = $params['name'];
            $inscription->phone = $params['phone'];
            $inscription->price = $product->price;
            $inscription->level = $params['level'];
            $inscription->ip = FG::getRealIP();
            $inscription->company_id = $company['id'];

            $upload = $request->getUploadedFiles();
            $baseurl = "upload/voucher/";
            $fullpath = __DIR__."/../../public/".$baseurl;
            if (!is_dir($fullpath)) {
                mkdir($fullpath, 0777,true);
            }
            $file = $upload['file'];
            if ($file->getError() == UPLOAD_ERR_OK) {
                $uniqid = uniqid(time());
                $fileName = strtolower($file->getClientFilename());
                $path = $baseurl."$uniqid-$fileName";
                $file->moveTo($path);
                unlink(__DIR__."/../../public/".$inscription->file);
                $inscription->file = "/$path";
                $inscription->status = Inscription::ENVIADO;
            }
            $inscription->comment = $params['comment'];
            $inscription->save();

            $code = $inscription->code;

            $rsp['data'] = compact('code');
            $rsp['success'] = true;
            $rsp['message'] = 'Se registro correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}
}