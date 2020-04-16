<?php

ini_set('display_errors', 1);
require_once './vendor/autoload.php';

Flight::register('view', 'Smarty', array(), function($smarty){
    $smarty->template_dir = './app/Views/Templates/Flatcats/';
    $smarty->compile_dir = './app/Views/Compiled/';
    //$smarty->config_dir = './config/';
    //$smarty->cache_dir = './cache/';
});

Flight::register('db', 'Medoo\Medoo', [database()]);

Flight::route('/', function (){
    $c = Flight::db()->select('categories', '*');
});

Flight::route('/admin/*', function (){
    Flight::view()->template_dir = './app/Views/Templates/Admin/';
    return true;
});

Flight::route('/admin/product/create/', ['App\Modules\Product', 'create']);

Flight::route('/admin/object_params/create/', ['App\Modules\ObjectParams', 'create']);

Flight::start();