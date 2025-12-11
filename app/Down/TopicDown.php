<?php 

namespace App\Down;

use App\Utilitarian\{FG};
use App\Model\{Topic};

class TopicDown {

    public function save($request) {
		$rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());
            $topic                = @$id > 0 ? Topic::where('id', $id)->first() : new Topic();
            $topic->name          = $name;
            $topic->description   = $description;
            $topic->order         = isset($order) ? (int) $order : 0;
            $topic->product_id    = $product_id;
            $topic->save();
            
            $rsp['success'] = true;
            $rsp['data']= compact('topic');
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
            $topic = Topic::where('id', $id)->first();
            if (!$topic) {
                throw new \Exception('No se logró encontrar el tema a eliminar');
            }
            $topic->deleted_at = FG::getDateHour();
            $topic->save();

            $rsp['success'] = true;
            $rsp['message'] = 'Se elimino correctamente';
        } catch (\Exception $e) {
            $rsp['message'] = $e->getMessage();
        }
        return $rsp;
	}
}