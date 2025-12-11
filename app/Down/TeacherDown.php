<?php 

namespace App\Down;

use App\Utilitarian\{FG};
use App\Model\{Teacher};

class TeacherDown {

    public function index($request) {
		$rsp = FG::responseDefault();
        try {
            $company_id = $_SESSION['COMPANY_ID'];
            $teachers = Teacher::where('company_id', $company_id)->get();
            $rsp['success'] = true;
            $rsp['data'] = compact('teachers', 'company_id');
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

    public function save($request) {
		$rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());
            $teacher                = @$id > 0 ? Teacher::where('id', $id)->first() : new Teacher();
            $teacher->name          = $name;
            $teacher->lastname      = $lastname;
            $teacher->company_id    = $company_id;
            $teacher->save();

            $upload = $request->getUploadedFiles();
            $baseurl = "upload/teacher/";
            $fullpath = __DIR__."/../../public/".$baseurl;
            if (!is_dir($fullpath)) {
                mkdir($fullpath, 0777,true);
            }

            $file = $upload['image'];
            if ($file->getError() == UPLOAD_ERR_OK) {
                $uniqid = uniqid(time());
                $fileName = strtolower($file->getClientFilename());
                $path = $baseurl."$uniqid-$fileName";
                $file->moveTo($path);
                unlink(__DIR__."/../../public/".$teacher->image);
                $teacher->image = "/$path";
                $teacher->save();
            }

            $rsp['success'] = true;
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
            if (!$id) {
                throw new \Exception('El parametro id es obligatorio');
            }
            $teacher = Teacher::where('id', $id)->first();
            if (!$teacher) {
                throw new \Exception('No se logró encontrar el menú a eliminar');
            }
            $teacher->deleted_at = FG::getDateHour();
            $teacher->save();

            $rsp['success'] = true;
            $rsp['message'] = 'Se elimino correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}
    
	public function scheme($request) {
		$rsp = FG::responseDefault();
        try {
            $menus = Menu::where('deleted_at')->get();
            $rsp['success'] = true;
            $rsp['data'] = compact('menus');
            $rsp['message'] = 'successfully';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}

}