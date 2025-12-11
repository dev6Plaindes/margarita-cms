<?php 

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;

class Message extends Model {

    const SUBSCRIPTION_TYPE = 1;
    const CONTACT_TYPE = 2;
    const MESSAGE_TYPE = 3;

	protected $table = 'messages';

}