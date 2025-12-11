<?php

namespace App\Down;

use App\Utilitarian\{FG};
use App\Model\{Content, Section, Company, ContentColor, ContentImage, ContentType, ContentFile};
// use Illuminate\Database\Capsule\Manager as Capsule;

class ContentDown
{

    public function index($request)
    {
        $rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());
            $company_id = $_SESSION['COMPANY_ID'];
            $contents = Content::getContentsByCompanyId($company_id);
            $rsp['success'] = true;
            $rsp['data'] = compact('contents', 'company_id');
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
    }

    public function edit($request)
    {
        $rsp = FG::responseDefault();
        try {
            $id = $request->getAttribute('id');
            if (!is_numeric($id)) {
                throw new \Exception('El parametro debe ser númerico');
            }
            $company_id = $_SESSION['COMPANY_ID'];
            $content = Content::getContentById($id);
            $content->type->settings = json_decode($content->type->settings);
            $sections = Section::getSectionsByCompanyId($company_id);
            $children = Content::getChildrenContentsById($content->id);
            $type_ids = array();
            $groups = array();
            foreach ($children as $k => $o) {
                array_push($type_ids, $o->type_id);
            }
            if (count($type_ids)) {
                $types = ContentType::whereIn('id', $type_ids)->get()->toArray();
                foreach ($types as $k => $o) {
                    $data = array();
                    $types[$k]['settings'] = json_decode($o['settings']);
                    foreach ($children as $kk => $oo) {
                        if ($oo->type_id == $o['id']) {
                            array_push($data, $oo);
                        }
                    }
                    $types[$k]['data'] = $data;
                    array_push($groups, $types[$k]);
                }
            }
            $rsp['success'] = true;
            $rsp['data'] = compact('content', 'sections', 'company_id', 'groups');
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        // echo json_encode($rsp); exit();
        return $rsp;
    }

    public function create($request)
    {
        $rsp = FG::responseDefault();
        try {
            $company_id = $_SESSION['COMPANY_ID'];
            $content = new Content();
            $sections = Section::getSectionsByCompanyId($company_id);
            $colors = [];
            $images = [];
            $rsp['success'] = true;
            $rsp['data'] = compact('content', 'sections', 'company_id', 'colors', 'images');
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
    }

    public function saveData($request)
    {
        $rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());
            if (!is_numeric($company_id)) {
                throw new \Exception('El campo company_id es obligatorio');
            }
            if (!is_numeric($section_id)) {
                throw new \Exception('El campo section_id es obligatorio');
            }
            if (!is_numeric($type_id)) {
                throw new \Exception('El campo type_id es obligatorio');
            }
            $content              = is_numeric($id) ? Content::getContentById($id) : new Content();
            $content->name        = $name;
            $content->caption     = $caption;
            $content->description = $description;
            $content->price       = isset($price) ? $price : 0;
            $content->boolean     = isset($boolean) ? ($boolean ? 1 : 0) : 0;
            $content->type_name   = isset($type_name) ? $type_name : null;
            $content->url         = $url;
            $content->status      = isset($status) ? $status : 0;
            $content->company_id  = $company_id;
            $content->section_id  = $section_id;
            $content->type_id     = $type_id;
            $content->order       = !is_null($order) ? $order : 0;
            $content->save();

            # COLORS
            $color_ids = array();
            if (isset($colors) && is_array($colors) && count($colors) > 0) {
                foreach ($colors as $k => $o) {
                    if ($o['color']) {
                        $color = @$o['id'] > 0 ? ContentColor::where('id', $o['id'])->first() : new ContentColor();
                        $color->color = $o['color'];
                        $color->content_id = $content->id;
                        $color->save();
                        array_push($color_ids, $color->id);
                    }
                }
            }
            $exists = ContentColor::where('content_id', $id)->where('deleted_at')->get();
            if (count($exists) > 0) {
                foreach ($exists as $k => $o) {
                    if (!in_array($o->id, $color_ids)) {
                        $o->deleted_at = FG::getDateHour();
                        $o->save();
                    }
                }
            }

            # IMAGES
            $baseurl = "upload/images/";
            $basepath = __DIR__ . "/../../public/";
            $fullpath = $basepath . $baseurl;
            if (!is_dir($fullpath)) {
                mkdir($fullpath, 0777, true);
            }

            $uploads = $request->getUploadedFiles();
            $image_ids = array();
            foreach ($images as $k => $o) {
                $image = @$o['id'] > 0 ? ContentImage::where('id', $o['id'])->where('deleted_at')->first() : new ContentImage();
                $image->content_id = $content->id;
                $image->company_id = $company_id;
                if (isset($uploads['images']) && is_array($uploads['images']) && count($uploads['images']) > 0) {
                    $file = $uploads['images'][$k]['image'];
                    if ($file->getError() == UPLOAD_ERR_OK) {
                        $uniqid = uniqid(time());
                        $fileName = strtolower($file->getClientFilename());
                        $path = $baseurl . "$uniqid-$fileName";
                        $file->moveTo($path);
                        unlink($basepath . $logo->logo);
                        $image->image = "/$path";
                        $image->save();
                    }
                }
                array_push($image_ids, $image->id);
            }

            $exists = ContentImage::where('content_id', $id)->where('deleted_at')->get();
            if (count($exists) > 0) {
                foreach ($exists as $k => $o) {
                    if (!in_array($o->id, $image_ids)) {
                        $o->deleted_at = FG::getDateHour();
                        $o->save();
                        unlink($basepath . $o->image);
                    }
                }
            }

            # FILES
            $baseurl = "upload/files/";
            $basepath = __DIR__ . "/../../public/";
            $fullpath = $basepath . $baseurl;
            if (!is_dir($fullpath)) {
                mkdir($fullpath, 0777, true);
            }
            $files = is_array($uploads['files']) ? $uploads['files'] : [];

            for ($i = 0; $i < count($files); $i++) {
                $file = $files[$i];
                if ($file->getError() == UPLOAD_ERR_OK) {
                    $mycontentfile = ContentFile::where('content_id', $content->id)->first();
                    if ($mycontentfile) {
                        $mycontentfile->deleted_at = FG::getDateHour();
                        $mycontentfile->save();
                    }

                    $uniqid = uniqid(time());
                    $fileName = strtolower($file->getClientFilename());
                    $path = $baseurl . "$uniqid-$fileName";
                    $file->moveTo($path);

                    $contentFile = new ContentFile();
                    $contentFile->content_id = $content->id;
                    $contentFile->name = $file->getClientFilename();
                    $contentFile->url = "/$path";
                    $contentFile->type = $file->getClientMediaType();
                    $contentFile->peso = $file->getSize();
                    $contentFile->size = FG::getZiseConvert($file->getSize());
                    $contentFile->format = pathinfo($contentFile->name, PATHINFO_EXTENSION);
                    $contentFile->bucket = "localhost";
                    $contentFile->save();
                }
            }

            $content = Content::with(['colors', 'images', 'files'])->where('id', $content->id)->first();

            $rsp['success'] = true;
            $rsp['data'] = compact('content');
            $rsp['message'] = 'Se guardo correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
    }

    public function remove($request)
    {
        $rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());
            if (!$id) {
                throw new \Exception('El parametro id es obligatorio');
            }
            $content = Content::where('id', $id)->first();
            if (!$content) {
                throw new \Exception('No se logró encontrar la sección a eliminar');
            }
            $content->deleted_at = FG::getDateHour();
            $content->save();

            $rsp['success'] = true;
            $rsp['message'] = 'Se elimino correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
    }
}
