<?php

    // $authSession = new \App\Session\AuthSession();
    // $authSession->init(@$company['template_id']);

    $map->attach('comunidadpro.', '/comunidadpro', function ($map) {

        require_once __DIR__ . "/Route/AuthRoute.php";

    });

?>