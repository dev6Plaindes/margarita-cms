<?php 

namespace App\Model;

use App\Model\{SubTopic_p};
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Eloquent\SoftDeletes;

class Topic_p extends Model {

	use SoftDeletes;

	protected $table = 'topics_portafolios';

	public function subtopics_portafolios() {
        return $this->hasMany(SubTopic_p::class, 'topic_portafolio_id', 'id');
    }

}

