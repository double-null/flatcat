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

App\Controllers\PageController::start();

Flight::route('/', ['App\Controllers\PageController', 'main']);

Flight::route('/set_lang/', ['App\Controllers\LangController', 'change']);

Flight::route('/flats_and_rooms/', function (){App\Controllers\RealtyController::listing(1);});

Flight::route('/lands_and_houses/', function (){App\Controllers\RealtyController::listing(3);});

Flight::route('/commercial/', function (){App\Controllers\RealtyController::listing(2);});

Flight::route('/garages/', function (){App\Controllers\RealtyController::listing(4);});

Flight::route('/suburban/', function (){App\Controllers\RealtyController::listing(5);});

Flight::route('/search/', ['App\Controllers\RealtyController', 'search']);

Flight::route('/about/', ['App\Controllers\PageController', 'about']);

Flight::route('/contacts/', ['App\Controllers\PageController', 'contacts']);

Flight::route('/for_seller/', ['App\Controllers\PageController', 'for_seller']);

Flight::route('/rent/', ['App\Controllers\PageController', 'rent']);

Flight::route('/feedback_send/', ['App\Controllers\FeedbackController', 'send']);

Flight::route('/test/', function (){App\Controllers\APIController::updateProduct(1);});

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

Flight::route('/admin/blocks/', ['App\Controllers\BlockController', 'listing']);

Flight::route('/admin/block/mod/@id/', function($id){App\Controllers\BlockController::update($id);});

Flight::route('/admin/users/', ['App\Controllers\UserController', 'listing']);

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

Flight::route('/admin/objects/', ['App\Controllers\RealtyController', 'privateListing']);

Flight::route('/admin/realty/create/', ['App\Controllers\RealtyController', 'create']);

Flight::route('/admin/object/mod/', ['App\Controllers\RealtyController', 'modify']);

Flight::route('/admin/advantages/', ['App\Controllers\AdvantageController', 'listing']);

Flight::route('/admin/advantage/create/', ['App\Controllers\AdvantageController', 'create']);

Flight::route('/admin/parameters/', ['App\Modules\Parameter', 'listing']);

Flight::route('/admin/parameter/drop/', ['App\Controllers\ParameterController', 'drop']);

Flight::route('/admin/parameter/create/@id/',
    function ($id) {App\Controllers\ParameterController::create($id);}
);

Flight::route('/admin/parameter/modify/@id/',
    function ($id) {App\Controllers\ParameterController::modify($id);}
);

Flight::route('/admin/reviews/', ['App\Controllers\ReviewController', 'listing']);

Flight::route('/admin/review/create/', ['App\Controllers\ReviewController', 'create']);

Flight::route('/admin/intrum/actions/', ['App\Controllers\APIController', 'starter']);

Flight::start();