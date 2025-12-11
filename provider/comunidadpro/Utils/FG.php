<?php

namespace Provider\comunidadpro\Utils;
use Carbon\Carbon;

class FG
{

    public static function getDefaultErrorMessage() {
        return "Este servicio no se encuentra disponible en estos instantes. Inténtelo más tarde.";
    }
    
    public static function responseDefault() {
        return ['success'=>false, 'data'=>null, 'message'=> self::getDefaultErrorMessage()];
    }

    public static function responseJSONDefault() {
        return json_decode(json_encode(self::responseDefault()));
    }

    public static function isEmail($str = "") {
        return filter_var($str, FILTER_VALIDATE_EMAIL);
    }

}