<?php 

namespace App\Model;

use App\Model\{SubTopic};
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Eloquent\SoftDeletes;

class Topic extends Model {

	use SoftDeletes;

	protected $table = 'topics';

	public function subtopics() {
        return $this->hasMany(SubTopic::class);
    }

}

