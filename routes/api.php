<?php

    $map->attach('api.', '/api', function ($map) {

        $map->attach('v1.', '/v1', function ($map) {

            $map->post('init', '/',[
                'Controller' => 'App\Controller\HomeController',
                'Action' => 'contents'
            ]);

            $map->post('company', '/company',[
                'Controller' => 'App\Controller\HomeController',
                'Action' => 'company'
            ]);

            $map->post('products', '/products',[
                'Controller' => 'App\Controller\HomeController',
                'Action' => 'products'
            ]);
            
            $map->post('authcms', '/authcms',[
                'Controller' => 'App\Controller\UserController',
                'Action' => 'authcms'
            ]);

            $map->post('slug', '/{slug}',[
                'Controller' => 'App\Controller\HomeController',
                'Action' => 'contents'
            ]);
    
            // $map->post('home.slug', '/home/{slug}',[
            //     'Controller' => 'App\Controller\HomeController',
            //     'Action' => 'contents'
            // ]);           

        });
    });

?>