<?php 

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Eloquent\SoftDeletes;

class ProductImage extends Model {

	use SoftDeletes;
	
	protected $table = 'products_images';

}

