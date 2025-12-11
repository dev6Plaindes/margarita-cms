<?php 

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;

class TemplateView extends Model {

	protected $table = 'templates_views';

	const HOME_INDEX = 1;
    const PRODUCT_INDEX = 2;
    const GALLERY = 3;
    const CONTACT = 4;
    const TERMS_CONDITIONS = 5;
    const PRIVACY_POLICIES = 6;
    const PORTAFOLIOS = 7;
    const BLOG = 8;
    const PORTAFOLIOS_AUDIO = 9;
    const PREGUNTAS_FRECUENTES = 10;

}

