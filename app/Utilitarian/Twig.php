<?php

namespace App\Utilitarian;

class Twig
{
    public static function render($filename, $data = [], $global = [])
    {
        $loader = new \Twig\Loader\FilesystemLoader('../views');
        $twig = new \Twig\Environment($loader, [
          'debug' =>  true,
          'cache' => false, 
        ]);
        $PROFILE = array( 'MASTER' => 1, 'ADMIN' => 2 );
        $param = [ "SESSION" => $_SESSION, 'URI' => $_SERVER["REQUEST_URI"], 'GET' => $_GET, 'PROFILE' => $PROFILE ];
        if (count($global)) {
          foreach ($global as $key => $item) {
            $param[$key] = $item;
          }
        }
        $twig->addGlobal("APP", $param);
        return $twig->render($filename, $data);
    }
}
?>