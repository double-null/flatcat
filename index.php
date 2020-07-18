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

Flight::route('/', function () {
    \App\Controllers\ProductController::listingForCategory(1);
});

Flight::route('/flats_and_rooms/', ['App\Controllers\PageController', 'flats']);

Flight::route('/new_buildings/', ['App\Controllers\PageController', 'new_buildings']);

Flight::route('/suburban/', ['App\Controllers\PageController', 'suburban']);

Flight::route('/rent/', ['App\Controllers\PageController', 'rent']);

Flight::route('/commercial/', ['App\Controllers\PageController', 'commercial']);

Flight::route('/test/', ['App\Controllers\APIController', 'test']);

Flight::route('/agents/', ['App\Controllers\UserController', 'openListing']);

Flight::route('/agent/@id/', function ($id){App\Controllers\UserController::show($id);});

Flight::route('/reviews/', ['App\Controllers\ReviewController', 'listing']);

Flight::route('/product_counter/', ['App\Controllers\ProductController', 'countingProducts']);

Flight::route('/category/@name(/@page)/', function ($name, $page) {
    \App\Controllers\ProductController::listingForCategory($name, $page);
});

Flight::route('/object/@category-@object/', function ($category, $object) {
        App\Controllers\RealtyController::show($object, $category);
});

Flight::route('/admin/*', function (){
    Flight::set('user_id', $_SESSION['user']['id'] ?? null);
    Flight::set('user_role', $_SESSION['user']['role'] ?? null);
    Flight::view()->template_dir = './app/Views/Templates/Admin/';
    Flight::view()->assign('user_info', $_SESSION['user'] ?? null);
    return true;
});

Flight::route('/admin/enter/', ['App\Controllers\UserController', 'auth']);

Flight::route('/admin/users/', ['App\Controllers\UserController', 'listing']);

Flight::route('/admin/user/create/', ['App\Controllers\UserController', 'create']);

Flight::route('/admin/user/search/', ['App\Controllers\UserController', 'search']);

Flight::route('/admin/user/drop/', ['App\Controllers\UserController', 'drop']);

Flight::route('/admin/user_settings/', ['App\Controllers\UserController', 'settings']);

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

Flight::route('/admin/parameter/modify/@id/',
    function ($id) {App\Controllers\ParameterController::modify($id);}
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

Flight::route('/admin/reviews/', ['App\Controllers\ReviewController', 'listing']);

Flight::route('/admin/review/create/', ['App\Controllers\ReviewController', 'create']);

Flight::route('/admin/intrum/actions/', ['App\Controllers\APIController', 'starter']);

Flight::start();