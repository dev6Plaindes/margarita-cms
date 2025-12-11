<?php

    $map->attach('auth.', '/auth', function ($map) {

        $map->post('signin', '/signin',[
            'Controller' => 'Provider\comunidadpro\Controller\AuthController',
            'Action' => 'signin'
        ]);

        $map->post('signup', '/signup',[
            'Controller' => 'Provider\comunidadpro\Controller\AuthController',
            'Action' => 'signup'
        ]);

        $map->post('signout', '/signout',[
            'Controller' => 'Provider\comunidadpro\Controller\AuthController',
            'Action' => 'signout'
        ]);

    });

?>