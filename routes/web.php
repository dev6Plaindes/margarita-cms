<?php

    $map->get('inicio', '/',[
        'Controller' => 'App\Controller\HomeController',
        'Action' => 'contentByMenuSlug'
    ]);


    $map->get('menu.slug', '/{slug}',[
        'Controller' => 'App\Controller\HomeController',
        'Action' => 'contentByMenuSlug'
    ]);

    $map->post('contact.subs', '/contact/suscription',[
        'Controller' => 'App\Controller\MessageController',
        'Action' => 'addSubscription'
    ]);

    $map->post('contact.message', '/contact/message',[
        'Controller' => 'App\Controller\MessageController',
        'Action' => 'addMessage'
    ]);

    $map->post('contact.message.softdyanmic', '/contact/message_softdynamic',[
        'Controller' => 'App\Controller\MessageController',
        'Action' => 'addMessageContact'
    ]);

    $map->post('contact.message.casaleglia', '/contact/message_casaleglia',[
        'Controller' => 'App\Controller\MessageController',
        'Action' => 'addMessageContact_cl'
    ]);

    $map->post('contact.message.new', '/message/new',[
        'Controller' => 'App\Controller\MessageController',
        'Action' => 'newMessage'
    ]);
//ALIAS RUTA PRODUCTO
    $map->get('product.slug', '/producto/{slug}',[
        'Controller' => 'App\Controller\HomeController',
        'Action' => 'productDetailBySlug'
    ]);

    $map->get('product.alias.slug', '/proyecto/{slug}',[
        'Controller' => 'App\Controller\HomeController',
        'Action' => 'productDetailBySlug'
    ]);
//FIN ALIAS
    $map->get('payment.slug', '/producto/pago/{slug}',[
        'Controller' => 'App\Controller\PaymentController',
        'Action' => 'viewPurchaseProduct'
    ]);

    $map->post('payment.save.slug', '/producto/pago/{slug}',[
        'Controller' => 'App\Controller\PaymentController',
        'Action' => 'purchaseProduct'
    ]);

    $map->get('payment.code', '/pago/{code}',[
        'Controller' => 'App\Controller\PaymentController',
        'Action' => 'viewPurchaseCode'
    ]);

    $map->post('payment.save.code', '/pago/{code}',[
        'Controller' => 'App\Controller\PaymentController',
        'Action' => 'purchaseCode'
    ]);

    $map->post('product.slug.register', '/producto/{slug}',[
        'Controller' => 'App\Controller\HomeController',
        'Action' => 'register'
    ]);

    $map->get('portafolio.slug', '/portafolio/{slug}',[
        'Controller' => 'App\Controller\HomeController',
        'Action' => 'portafolioDetailBySlug'
    ]);

    $map->get('slug_item', '/{slug}/{data}',[
        'Controller' => 'App\Controller\HomeController',
        'Action' => 'getTemplateAction'
    ]);

    $map->post('mongo.users', '/mongo/users',[
        'Controller' => 'App\Controller\HomeController',
        'Action' => 'users'
    ]);

    $map->post('duplicate', '/company/duplicate',[
        'Controller' => 'App\Controller\CompanyController',
        'Action' => 'duplicateContent'
    ]);

?>