<?php

namespace App\Persistence;

class Mongodb {
 
    private static $database;
    private static $client;
    private static $clientUrl;
  
    function __construct($host = null, $port = null, $user = null, $pass = null, $database = null)
    {
        $host = $host ? $host : $_ENV['MONGODB_SERVER'];
        $port = $port ? $port : $_ENV['MONGODB_PORT'];
        $user = $user ? $user : $_ENV['MONGODB_USER'];
        $pass = $pass ? $pass : $_ENV['MONGODB_PASSWORD'];
        self::$database = $database ? $database : $_ENV['MONGODB_DATABASE'];
        self::$client = new \MongoDB\Client("mongodb://{$user}:{$pass}@{$host}:{$port}");
        self::$clientUrl = new \MongoDB\Client("mongodb://{$host}:{$port}");
    }
  
    public static function Connection($database = null)
    {
        try {
            return self::$client->selectDatabase($database ? $database : self::$database);
        } catch (\Throwable $th) {
            return $th->getMessage();
        }
    }
  
    public static function ConnectionUrl($database = null)
    {
        try {
            return self::$clientUrl->selectDatabase($database ? $database : self::$database);
        } catch (\Throwable $th) {
            return $th->getMessage();
        }
    }
}