<?php

namespace App\Controllers;

use App\Models\Advantage;
use App\Models\Block;
use App\Models\Category;
use App\Models\FilterVariants;
use App\Models\Review;
use Flight;

class PageController
{
    public static function main()
    {
        Flight::view()->assign('inscriptions', Block::getOneByParams(['name' => 'main_page']));
        Flight::view()->assign('advantages', Advantage::getAll());
        Flight::view()->assign('reviews', Review::getAll());
        Flight::view()->assign('variants', FilterVariants::getAllByFilters([10,11]));
        Flight::view()->display('pages/main.tpl');
    }

    public static function about()
    {
        Flight::view()->assign('inscriptions', Block::getOneByParams(['name' => 'about']));
        Flight::view()->display('pages/about.tpl');
    }

    public static function contacts()
    {
        Flight::view()->assign('inscriptions', Block::getOneByParams(['name' => 'contacts']));
        Flight::view()->display('pages/about.tpl');
    }

    public static function for_seller()
    {
        Flight::view()->assign('inscriptions', Block::getOneByParams(['name' => 'for_seller']));
        Flight::view()->assign('advantages', Advantage::getAll());
        Flight::view()->display('pages/for_seller.tpl');
    }

    public static function start()
    {
        LangController::setDefault();
        Flight::view()->assign('lang', $_SESSION['lang']['short_name']);
        Flight::view()->assign('menu', Category::getAll());
        Flight::view()->assign('common', Block::getOneByParams(['name' => 'all_pages']));
    }
}
