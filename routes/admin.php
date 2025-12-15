<?php

    $map->attach('admin.', '/admin', function ($map) {

        $map->get('login', '/login', [
            'Controller' => 'App\Controller\AdminController',
            'Action' => 'login'
        ]);

        $map->post('postlogin', '/postlogin', [
            'Controller' => 'App\Controller\AdminController',
            'Action' => 'postlogin'
        ]);

        $map->post('signout', '/signout', [
            'Controller' => 'App\Controller\AdminController',
            'Action' => 'signout'
        ]);

        $map->get('dashboard', '', [
            'Controller' => 'App\Controller\AdminController',
            'Action' => 'dashboard'
        ]);
        
        $map->get('user.profile', '/usuario/perfil', [
            'Controller' => 'App\Controller\UserController',
            'Action' => 'profile'
        ]);

        $map->post('user.saveProfile', '/user/saveProfile', [
            'Controller' => 'App\Controller\UserController',
            'Action' => 'saveProfile'
        ]);

        $map->post('user.changePassword', '/user/changePassword', [
            'Controller' => 'App\Controller\UserController',
            'Action' => 'changePassword'
        ]);
        
        $map->get('company.company', '/empresa', [
            'Controller' => 'App\Controller\CompanyController',
            'Action' => 'company'
        ]);
        
        $map->get('company.interface', '/empresa/interfaz', [
            'Controller' => 'App\Controller\CompanyController',
            'Action' => 'interface'
        ]);

        $map->get('company.payment', '/empresa/pagos', [
            'Controller' => 'App\Controller\CompanyController',
            'Action' => 'payment'
        ]);

        $map->get('landing.scheme', '/landing/esquema', [
            'Controller' => 'App\Controller\AdminController',
            'Action' => 'scheme'
        ]);

        $map->get('landing.menu.index', '/landing/menus', [
            'Controller' => 'App\Controller\MenuController',
            'Action' => 'index'
        ]);
        
        $map->get('landing.content.index', '/landing/contenidos', [
            'Controller' => 'App\Controller\ContentController',
            'Action' => 'index'
        ]);
        
        $map->get('landing.section.index', '/landing/secciones', [
            'Controller' => 'App\Controller\SectionController',
            'Action' => 'index'
        ]);

        $map->get('landing.content.edit', '/landing/contenidos/editar/{id}', [
            'Controller' => 'App\Controller\ContentController',
            'Action' => 'edit'
        ]);

        $map->get('landing.content.create', '/landing/contenidos/crear', [
            'Controller' => 'App\Controller\ContentController',
            'Action' => 'create'
        ]);

        $map->get('landing.gallery.index', '/landing/galeria', [
            'Controller' => 'App\Controller\GalleryController',
            'Action' => 'index'
        ]);

        $map->post('landing.gallery.handle', '/landing/galeria/handle', [
            'Controller' => 'App\Controller\GalleryController',
            'Action' => 'handle'
        ]);

        $map->post('landing.gallery.save', '/landing/galeria/save', [
            'Controller' => 'App\Controller\GalleryController',
            'Action' => 'save'
        ]);

        $map->post('landing.gallery.order', '/landing/galeria/order', [
            'Controller' => 'App\Controller\GalleryController',
            'Action' => 'order'
        ]);

        $map->post('landing.gallery.remove', '/landing/galeria/remove', [
            'Controller' => 'App\Controller\GalleryController',
            'Action' => 'remove'
        ]);

        $map->get('message.index', '/mensajes', [
            'Controller' => 'App\Controller\MessageController',
            'Action' => 'index'
        ]);

        $map->post('company.company.saveData', '/company/saveData', [
            'Controller' => 'App\Controller\CompanyController',
            'Action' => 'saveData'
        ]);

        $map->post('company.company.saveInterface', '/company/saveInterface', [
            'Controller' => 'App\Controller\CompanyController',
            'Action' => 'saveInterface'
        ]);

        $map->post('company.company.savePayment', '/company/savePayment', [
            'Controller' => 'App\Controller\CompanyController',
            'Action' => 'savePayment'
        ]);

        $map->post('section.saveData', '/section/saveData', [
            'Controller' => 'App\Controller\SectionController',
            'Action' => 'saveData'
        ]);

        $map->post('menu.saveData', '/menu/saveData', [
            'Controller' => 'App\Controller\MenuController',
            'Action' => 'saveData'
        ]);

        $map->post('section.remove', '/section/remove', [
            'Controller' => 'App\Controller\SectionController',
            'Action' => 'remove'
        ]);

        $map->post('menu.remove', '/menu/remove', [
            'Controller' => 'App\Controller\MenuController',
            'Action' => 'remove'
        ]);

        $map->post('section.position', '/section/position', [
            'Controller' => 'App\Controller\SectionController',
            'Action' => 'position'
        ]);

        $map->post('section.liberate', '/section/liberate', [
            'Controller' => 'App\Controller\SectionController',
            'Action' => 'liberate'
        ]);
        
        $map->post('content.remove', '/content/remove', [
            'Controller' => 'App\Controller\ContentController',
            'Action' => 'remove'
        ]);

        $map->post('content.saveData', '/content/saveData', [
            'Controller' => 'App\Controller\ContentController',
            'Action' => 'saveData'
        ]);

        $map->get('ecommerce.category.index', '/ecommerce/categorias', [
            'Controller' => 'App\Controller\CategoryController',
            'Action' => 'index'
        ]);
        
        $map->post('category.saveData', '/category/saveData', [
            'Controller' => 'App\Controller\CategoryController',
            'Action' => 'saveData'
        ]);

        $map->post('category.remove', '/category/remove', [
            'Controller' => 'App\Controller\CategoryController',
            'Action' => 'remove'
        ]);

        $map->get('ecommerce.product.index', '/ecommerce/productos', [
            'Controller' => 'App\Controller\ProductController',
            'Action' => 'index'
        ]);

        $map->get('portafolios.portafolios.index', '/portafolios/portafolios', [
            'Controller' => 'App\Controller\PortafolioController',
            'Action' => 'index'
        ]);

        $map->get('portafolios.portafolios.multimedia', '/portafolios/podcast', [
            'Controller' => 'App\Controller\PortafolioController',
            'Action' => 'multimedia'
        ]);

        $map->get('ecommerce.product.edit', '/ecommerce/productos/editar/{id}', [
            'Controller' => 'App\Controller\ProductController',
            'Action' => 'edit'
        ]);

        $map->get('portafolios.portafolios.edit', '/portafolios/portafolios/editar/{id}', [
            'Controller' => 'App\Controller\PortafolioController',
            'Action' => 'edit'
        ]);

        $map->get('ecommerce.product.create', '/ecommerce/productos/crear', [
            'Controller' => 'App\Controller\ProductController',
            'Action' => 'create'
        ]);

        $map->get('portafolios.portafolios.create', '/portafolios/portafolios/crear/{type_id}', [
            'Controller' => 'App\Controller\PortafolioController',
            'Action' => 'create'
        ]);
            
        $map->post('product.saveData', '/product/saveData', [
            'Controller' => 'App\Controller\ProductController',
            'Action' => 'saveData'
        ]);

        $map->post('portafolio.saveData', '/portafolio/saveData', [
            'Controller' => 'App\Controller\PortafolioController',
            'Action' => 'saveData'
        ]);

        $map->post('product.remove', '/product/remove', [
            'Controller' => 'App\Controller\ProductController',
            'Action' => 'remove'
        ]);

        $map->post('portafolio.remove', '/portafolio/remove', [
            'Controller' => 'App\Controller\PortafolioController',
            'Action' => 'remove'
        ]);

        $map->post('ecommerce.product.characteristic.saveData', '/product/characteristic/saveData', [
            'Controller' => 'App\Controller\ProductController',
            'Action' => 'saveCharacteristic'
        ]);

        $map->post('ecommerce.product.characteristic.remove', '/product/characteristic/remove', [
            'Controller' => 'App\Controller\ProductController',
            'Action' => 'removeCharacteristic'
        ]);

        $map->post('ecommerce.product.image.store', '/product/imagenes/store', [
            'Controller' => 'App\Controller\ProductController',
            'Action' => 'storeImage'
        ]);

        $map->post('ecommerce.product.image.remove', '/product/imagenes/remove', [
            'Controller' => 'App\Controller\ProductController',
            'Action' => 'removeImage'
        ]);

        $map->get('teacher.index', '/ecommerce/docentes', [
            'Controller' => 'App\Controller\TeacherController',
            'Action' => 'index'
        ]);

        $map->post('teacher.save', '/teacher/save', [
            'Controller' => 'App\Controller\TeacherController',
            'Action' => 'save'
        ]);

        $map->post('teacher.remove', '/teacher/remove', [
            'Controller' => 'App\Controller\TeacherController',
            'Action' => 'remove'
        ]);

        $map->post('topic.save', '/topic/save', [
            'Controller' => 'App\Controller\TopicController',
            'Action' => 'save'
        ]);

        $map->post('topic_p.save', '/topic_p/save', [
            'Controller' => 'App\Controller\TopicpController',
            'Action' => 'save'
        ]);

        $map->post('topic.remove', '/topic/remove', [
            'Controller' => 'App\Controller\TopicController',
            'Action' => 'remove'
        ]);

        $map->post('subtopic.save', '/subtopic/save', [
            'Controller' => 'App\Controller\SubTopicController',
            'Action' => 'save'
        ]);

        $map->post('subtopic_p.save', '/subtopic_p/save', [
            'Controller' => 'App\Controller\SubTopicpController',
            'Action' => 'save'
        ]);

        $map->post('subtopic.remove', '/subtopic/remove', [
            'Controller' => 'App\Controller\SubTopicController',
            'Action' => 'remove'
        ]);

        $map->post('inscription.manage', '/inscription/manage', [
            'Controller' => 'App\Controller\InscriptionController',
            'Action' => 'manage'
        ]);

        $map->get('system.settings.index', '/sistema/configuracion', [
            'Controller' => 'App\Controller\AdminController',
            'Action' => 'indexSettings'
        ]);

        $map->post('system.settings.save', '/sistema/configuracion/save', [
            'Controller' => 'App\Controller\AdminController',
            'Action' => 'saveSettings'
        ]);

    });

?>