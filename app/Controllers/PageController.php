<?php

namespace App\Controllers;

use App\Models\Review;
use Flight;

class PageController
{
    public static function main()
    {
        $reviews = Review::getAll();
        Flight::view()->assign('reviews', $reviews);
        Flight::view()->display('pages/main.tpl');
    }
}

