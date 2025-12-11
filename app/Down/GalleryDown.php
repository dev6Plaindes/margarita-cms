<?php 

namespace App\Down;

use App\Utilitarian\{FG};
use App\Model\{ContentImage, Company};

class GalleryDown {

	public function index($request) {
		$rsp = FG::responseDefault();
        try {
            $company_id = $_SESSION['COMPANY_ID'];
            $images = ContentImage::where('company_id', $company_id)->orderBy('order', 'asc')->get();
            $rsp['success'] = true;
            $rsp['data'] = compact('images', 'company_id');
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function handle($request) {
		$rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());

            $contentImage             = ContentImage::where('id', $id)->first();
            $contentImage->gallery    = $gallery;
            $contentImage->company_id = $company_id;
            $contentImage->save();

            $this->orderItems(-1, -1, $company_id);

            $images = $this->index($request)['data']['images'];

            $rsp['success'] = true;
            $rsp['data'] = compact('images');
            $rsp['message'] = 'Se guardo correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function remove($request) {
		$rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());

            $contentImage = ContentImage::where('id', $id)->first();
            if (!$contentImage) {
                throw new \Exception('No se logró encontrar la imagen a eliminar');
            }
            if ($contentImage->content_id > 0) {
                throw new \Exception('La imagen pertenece a un contenido');
            }

            unlink(__DIR__."/../../public/".$contentImage->image);

            $contentImage->deleted_at = FG::getDateHour();
            $contentImage->save();

            $this->orderItems(-1, -1, $contentImage->company_id);

            $images = $this->index($request)['data']['images'];

            $rsp['success'] = true;
            $rsp['data'] = compact('images');
            $rsp['message'] = 'Se elimino correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function saveData($request) {
		$rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());

            $baseurl = "upload/images/";
            $basepath = __DIR__."/../../public/";
            $fullpath = $basepath.$baseurl;
            $upload = $request->getUploadedFiles();
            $file = $upload['file'];
            if (!is_dir($fullpath)) {
                mkdir($fullpath, 0777,true);
            }
            if ($file->getError() == UPLOAD_ERR_OK) {
                $uniqid = uniqid(time());
                $fileName = strtolower($file->getClientFilename());
                $path = $baseurl."$uniqid-$fileName";
                $file->moveTo($path);
                $contentImage             = new ContentImage();
                $contentImage->image      = "/$path";
                $contentImage->content_id = 0;
                $contentImage->gallery    = 1;
                $contentImage->order      = count(ContentImage::where('gallery', 1)->where('company_id', $company_id)->get()) + 1;
                $contentImage->company_id = $company_id;
                $contentImage->save();
            } else {
                throw new \Exception('No se logró encontrar la imagen');
            }
            /*$uploads = $request->getUploadedFiles();
            $images = $uploads['images'];
            $image_ids = array();
            foreach ($images as $k => $o) {
                if (count($uploads) > 0) {
                    $file = $uploads['images'][$k]['image'];
                    if ($file->getError() == UPLOAD_ERR_OK) {                        
                        $uniqid = uniqid(time());
                        $fileName = strtolower($file->getClientFilename());
                        $path = $baseurl."$uniqid-$fileName";
                        $file->moveTo($path);
                        $contentImage             = new ContentImage();
                        $contentImage->image      = "/$path";
                        $contentImage->content_id = 0;
                        $contentImage->gallery    = 1;
                        $contentImage->company_id = $company_id;
                        $contentImage->save();
                    }
                }
            }*/

            $images = $this->index($request)['data']['images'];

            $rsp['success'] = true;
            $rsp['data'] = compact('images');
            $rsp['message'] = 'Se guardo correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function order($request) {
		$rsp = FG::responseDefault();
        try {
            $param      = $request->getParsedBody();
            $order      = $param['order'];
            $id         = $param['id'];
            $company_id = $param['company_id'];

            $contentImage = ContentImage::where('id', $id)->first();
            $contentImage->order = (int)$order;
            $contentImage->save();
            
            $this->orderItems($id, $order, $company_id);
    
            $images = $this->index($request)['data']['images'];

            $rsp['success'] = true;
            $rsp['data'] = compact('images');
            $rsp['message'] = 'Se guardo correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function orderItems($id, $order, $company_id) {
        $contentImages = ContentImage::where('gallery', 1)->where('company_id', $company_id)->orderBy('order', 'asc')->get();
        $dupdate = [];
        $count = 1;
        for ($i=0; $i < count($contentImages); $i++) { 
            $s = $contentImages[$i];
            if ($count == $order) {
                $count++;
            }
            if ($s->id != $id) {
                $dupdate[] = ["order"=>$count, "id"=>$s->id];
                $count++;
            }
        }
        foreach ($dupdate as $key => $item) {
            $contentImage = ContentImage::where('id', $item['id'])->first();
            $contentImage->order = (int)$item['order'];
            $contentImage->save();    
        }
    }

}