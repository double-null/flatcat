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
        $langID =  $_SESSION['lang']['id'];
        Flight::view()->assign('inscriptions', Block::getOneByParams([
            'name' => 'main_page',
            'lang' => $langID,
        ]));
        Flight::view()->assign('advantages', Advantage::getAllByLang($langID));
        Flight::view()->assign('reviews', Review::getAllForPage(6));
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
        $a = array (
            'fast_search_title' => 'Fast property search',
            'fast_search_btn' => 'Find',
            'reviews_title' => 'Customer reviews',
            'reviews_btn_text' => 'See all reviews',
            'advantages_title' => 'Why should you choose us to buy or sell real estate?',
        );

        //Flight::json($a);

        LangController::setDefault();
        Flight::view()->assign('lang', $_SESSION['lang']['short_name']);
        Flight::view()->assign('menu', Category::getAll($_SESSION['lang']['id']));
        Flight::set('langID', $_SESSION['lang']['id']);
        Flight::view()->assign('common', Block::getOneByParams([
            'name' => 'all_pages',
            'lang' => $_SESSION['lang']['id'],
        ]));
    }
}
