<?php 

namespace App\Model;

use App\Model\{DesignIcon};
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;

class Characteristic extends Model {

	protected $table = 'characteristics';

	public function design_icon() {
		return $this->belongsTo(DesignIcon::class, 'design_icon_id', 'id'); 
	}
}

