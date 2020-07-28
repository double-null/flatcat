<?php

namespace App\Controllers;

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
        Flight::view()->assign('advantages', Block::getOneByParams(['name' => 'advantages']));
        Flight::view()->assign('reviews', Review::getAll());
        Flight::view()->assign('variants', FilterVariants::getAllByFilters([10,11]));
        Flight::view()->display('pages/main.tpl');
    }

    public static function start()
    {
        LangController::setDefault();
        Flight::view()->assign('lang', $_SESSION['lang']['short_name']);
        Flight::view()->assign('menu', Category::getAll());
        Flight::view()->assign('common', Block::getOneByParams(['name' => 'all_pages']));
    }
}
