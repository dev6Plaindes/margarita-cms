<?php 

namespace App\Model;

use App\Utilitarian\{FG};
use App\Model\{Company};
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Eloquent\SoftDeletes;

class Transfer extends Model {

    use SoftDeletes;

	protected $table = 'transfers';

    const TYPE_BANK    = 1;
    const TYPE_MOBILE  = 2;

    public static function getTransfersByCompanyId($id) {
        return Transfer::where('deleted_at')->where('company_id', $id)->get();
    }

}

