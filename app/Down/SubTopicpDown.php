<?php 

namespace App\Down;

use App\Utilitarian\{FG};
use App\Model\{SubTopic_p};

class SubTopicpDown {

    public function save($request) {
		$rsp = FG::responseDefault();
        try {
            extract($request->getParsedBody());
            $subtopic                  = @$id > 0 ? SubTopic_p::where('id', $id)->first() : new SubTopic_p();
            $subtopic->name            = $name;
            $subtopic->description     = $description;
            $subtopic->url             = $url;
            $subtopic->order           = isset($order) ? (int) $order : 0;
            $subtopic->design_icon_id  = $design_icon_id;
            $subtopic->topic_portafolio_id        = $topic_id;
            $subtopic->save();
            
            $rsp['success'] = true;
            $rsp['data']= compact('subtopic');
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
            $topic = SubTopic::where('id', $id)->first();
            if (!$topic) {
                throw new \Exception('No se logró encontrar el subtema a eliminar');
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