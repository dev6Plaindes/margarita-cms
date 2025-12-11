<?php 

namespace App\Model;

use App\Utilitarian\{FG};
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Eloquent\SoftDeletes;

class CompanyLogo extends Model {

	use SoftDeletes;

	protected $table = 'companies_logos';

}

