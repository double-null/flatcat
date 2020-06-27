<?php
session_start();
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

Flight::route('/agents/', ['App\Controllers\UserController', 'openListing']);

/******************** DELETE  *********************************/

Flight::route('/test/', ['App\Controllers\APIController', 'updateProduct']);

Flight::route('/test2/', ['App\Controllers\APIController', 'updateCategories']);

Flight::route('/test3/', ['App\Controllers\APIController', 'updateFields']);

/******************** DELETE  *********************************/

Flight::route('/category/@name/', function ($name) {
    \App\Controllers\ProductController::listingForCategory($name);
});

Flight::route('/product/@name/', function ($name) {
    \App\Controllers\ProductController::show($name);
});

Flight::route('/admin/*', function (){
    Flight::set('user_id', (int)$_SESSION['user']['id']);
    Flight::set('user_role', (int)$_SESSION['user']['role']);
    Flight::view()->template_dir = './app/Views/Templates/Admin/';
    Flight::view()->assign('user_info', $_SESSION['user']);
    return true;
});

Flight::route('/admin/enter/', ['App\Controllers\UserController', 'auth']);

Flight::route('/admin/users/', ['App\Controllers\UserController', 'listing']);

Flight::route('/admin/user/create/', ['App\Controllers\UserController', 'create']);

Flight::route('/admin/user/drop/', ['App\Controllers\UserController', 'drop']);

Flight::route('/admin/user_profile/', ['App\Controllers\UserProfileController', 'update']);

Flight::route('/admin/category/create/', ['App\Controllers\CategoryController', 'create']);

Flight::route('/admin/categories/', ['App\Controllers\CategoryController', 'listing']);

Flight::route('/admin/category/show/@id/', function($id){App\Modules\Category::show($id);});

Flight::route('/admin/category/drop/', ['App\Controllers\CategoryController', 'drop']);

Flight::route('/admin/category_desc/@cat/', function($cat){
    App\Modules\CatDesc::$category = (int)$cat;
    App\Modules\CatDesc::listing();
});

Flight::route('/admin/category_desc/create/@cat/', function($cat){
    App\Modules\CatDesc::$category = (int)$cat;
    App\Modules\CatDesc::create();
});

Flight::route('/admin/parameters/', ['App\Modules\Parameter', 'listing']);

Flight::route('/admin/parameter/drop/', ['App\Controllers\ParameterController', 'drop']);

Flight::route('/admin/parameter/create/@id/',
    function ($id) {App\Controllers\ParameterController::create($id);}
);

Flight::route('/admin/product/create/', ['App\Controllers\ProductController', 'create']);

Flight::route('/admin/products/', ['App\Controllers\ProductController', 'listing']);

Flight::route('/admin/product_parameters/create/@id/', function($id){
    App\Modules\ProductParamModule::$id = (int)$id;
    App\Modules\ProductParamModule::create();
});

Flight::route('/admin/product_parameters/mod/@id/', function($id) {
    App\Controllers\ProductParamController::modify($id);
});

Flight::route('/admin/product_parameters/listing/@id/', function($id) {
    App\Controllers\ProductParamController::listing($id);
});

/* PRODUCT IMAGES */
Flight::route('/admin/product_images/listing/@id/', function($id) {
    App\Controllers\ProductImageController::listing($id);
});

Flight::route('/admin/product_images/create/@id/', function($id) {
    App\Controllers\ProductImageController::create($id);
});

/* PRODUCT ETC */
Flight::route('/admin/product_etc/@id/', function($id) {
    App\Controllers\ProductEtcController::listing($id);
});

Flight::route('/admin/product_etc/create/@id/', function($id) {
    App\Controllers\ProductEtcController::create($id);
});


Flight::route('/admin/object_params/create/', ['App\Modules\ObjectParams', 'create']);

Flight::start();