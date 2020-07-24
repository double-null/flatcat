<?php

namespace App\Controllers;

use App\Models\Block;
use App\Models\Review;
use Flight;

class PageController
{
    public static function main()
    {
        $reviews = Review::getAll();
        Flight::view()->assign('inscriptions', Block::getOneByParams(['name' => 'main_page']));
        Flight::view()->assign('advantages', Block::getOneByParams(['name' => 'advantages']));
        Flight::view()->assign('reviews', $reviews);
        Flight::view()->display('pages/main.tpl');
    }

    public static function start()
    {
        Flight::view()->assign('menu', Block::getOneByParams(['name' => 'menu']));
        Flight::view()->assign('common', Block::getOneByParams(['name' => 'all_pages']));
    }
}

