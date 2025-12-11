<?php 

namespace App\Model;

use App\Model\{DesignIcon};
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Eloquent\SoftDeletes;

class SubTopic extends Model {

	use SoftDeletes;

	protected $table = 'subtopics';

	public function design_icon() {
		return $this->belongsTo(DesignIcon::class, 'design_icon_id', 'id'); 
	}
}

