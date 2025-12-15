<?php

error_reporting(E_ERROR); // E_ALL // E_ERROR
date_default_timezone_set('America/Lima');
session_start();

require_once __DIR__ . "/../vendor/autoload.php";

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/../');
$dotenv->load();

$GLOBALS['COMPANY'] = NULL;

use Illuminate\Database\Capsule\Manager as Capsule;
use Aura\Router\RouterContainer;
use Laminas\Diactoros\ServerRequestFactory;

$capsule = new Capsule;

$capsule->addConnection([
    'driver'    => 'mysql',
    'host'      => $_ENV['DB_HOST'],
    'database'  => $_ENV['DB_NAME'],
    'username'  => $_ENV['DB_USER'],
    'password'  => $_ENV['DB_PASS'],
    'charset'   => 'utf8',
    'collation' => 'utf8_unicode_ci',
    'prefix'    => ''
]);

$request = ServerRequestFactory::fromGlobals(
    $_SERVER,
    $_GET,
    $_POST,
    $_COOKIE,
    $_FILES
);

// Make this Capsule instance available globally via static methods... (optional)
$capsule->setAsGlobal();

// Setup the Eloquent ORM... (optional; unless you've used setEventDispatcher())
$capsule->bootEloquent();
$routerContainer = new RouterContainer();
$map = $routerContainer->getMap();

require_once __DIR__ . "/../routes/index.php";

$company = \App\Middleware\Authenticate::CompanyData();
if ($company && $company['template_codigo'] && is_dir(__DIR__ . "/../provider/" . $company['template_codigo'])) {
    require_once __DIR__ . "/../provider/" . $company['template_codigo'] . "/index.php";
}else{
    $current_path = strtok($_SERVER['REQUEST_URI'], '?');
    $login_path = '/admin/login';
}

$matcher = $routerContainer->getMatcher();
$route = $matcher->match($request);

if (!$route) {
    // header ("Location: /");
    $controller = new App\Controller\HomeController;
    $response = $controller->contentByMenuSlug($request);
    echo is_object($response) ? $response->getBody() : json_encode($response);
    exit;
} else {

    // add route attributes to the request
    foreach ($route->attributes as $key => $val) {
        $request = $request->withAttribute($key, $val);
    }

    \App\Middleware\Authenticate::init($route, $request);
    $request = $request->withAttribute("att_company", $company);

    $handlerData = $route->handler;
    $controllerName = $handlerData['Controller'];
    $actionName = $handlerData['Action'];
    $controller = new $controllerName;
    $response = $controller->$actionName($request);

    if (is_object($response)) {
        echo $response->getBody();
    } else {
        echo json_encode($response);
    }
    exit;
}
