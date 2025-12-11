<?php 

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Eloquent\SoftDeletes;

class ContentType extends Model {

    use SoftDeletes;

	protected $table = 'contents_types';
    
}