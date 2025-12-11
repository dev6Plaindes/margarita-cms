<?php 

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Model\{ Product };

class Inscription extends Model {

	use SoftDeletes;
	
	protected $table = 'inscriptions';

	const PAGADO = 'pagado';
	const ENVIADO = 'enviado';
	const RECHAZADO = 'rechazado';
	const PENDIENTE = 'pendiente';

	public function product() {
		return $this->belongsTo(Product::class, 'product_id', 'id'); 
	}
}

