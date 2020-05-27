<?php

ini_set('display_errors', 1);
require_once './vendor/autoload.php';

Flight::register('view', 'Smarty', array(), function($smarty){
    $smarty->template_dir = './app/Views/Templates/Flatcat/';
    $smarty->compile_dir = './app/Views/Compiled/';
    //$smarty->config_dir = './config/';
    //$smarty->cache_dir = './cache/';
});

Flight::register('db', 'Medoo\Medoo', [database()]);

App\Modules\Application::start();

Flight::route('/', ['App\Modules\Page', 'main']);

Flight::route('/category/@name/', function ($name) {
    \App\Modules\ProductModule::listingByCategory($name);
});

Flight::route('/product/@name/', function ($name) {
    \App\Controllers\ProductController::show($name);
});

Flight::route('/admin/category/create/', ['App\Modules\Category', 'create']);

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


Flight::route('/admin/product/create/', ['App\Controllers\ProductController', 'create']);

Flight::route('/admin/products/', ['App\Modules\ProductModule', 'listing']);

Flight::route('/admin/product_parameters/create/@id/', function($id){
    App\Modules\ProductParamModule::$id = (int)$id;
    App\Modules\ProductParamModule::create();
});

Flight::route('/admin/product_parameters/listing/@id/', function($id) {
    App\Modules\ProductParamModule::$id = (int)$id;
    App\Modules\ProductParamModule::listing();
});

Flight::route('/admin/object_params/create/', ['App\Modules\ObjectParams', 'create']);

Flight::start();