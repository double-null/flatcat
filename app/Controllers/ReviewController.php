<?php

namespace App\Controllers;

use Flight;

class ReviewController
{
    public static function create()
    {
        Flight::view()->display('review/create.tpl');
    }

    public static function listing()
    {
        Flight::view()->display('review/listing.tpl');
    }
}