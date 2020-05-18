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

Flight::route('/admin/category/create/', ['App\Modules\Category', 'create']);

Flight::route('/admin/categories/', ['App\Modules\Category', 'listing']);

Flight::route('/admin/category/show/@id/', function($id){App\Modules\Category::show($id);});

Flight::route('/admin/category_desc/@cat/', function($cat){
    App\Modules\CatDesc::$category = (int)$cat;
    App\Modules\CatDesc::listing();
});

Flight::route('/admin/category_desc/create/@cat/', function($cat){
    App\Modules\CatDesc::$category = (int)$cat;
    App\Modules\CatDesc::create();
});

Flight::route('/admin/parameters/', ['App\Modules\Parameter', 'listing']);

Flight::route('/admin/parameter/create/', ['App\Modules\Parameter', 'create']);

Flight::route('/admin/param_desc/create/', ['App\Modules\ParamDesc', 'create']);

Flight::route('/admin/param_desc/listing/@id/', function($id) {
    App\Modules\ParamDesc::$id = (int)$id;
    App\Modules\ParamDesc::listing();
});

Flight::route('/admin/param_desc/create/@id/', function($id){
    App\Modules\ParamDesc::$id = (int)$id;
    App\Modules\ParamDesc::create();
});


Flight::route('/admin/product/create/', ['App\Modules\Product', 'create']);

Flight::route('/admin/object_params/create/', ['App\Modules\ObjectParams', 'create']);

Flight::start();