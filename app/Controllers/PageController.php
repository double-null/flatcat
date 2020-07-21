<?php

namespace App\Controllers;

use App\Models\CommercialRealty;
use App\Models\Flat;
use Flight;

class PageController
{
    public static function flats()
    {
        $flats = Flat::getAll();
        Flight::view()->assign('categoryID', 1);
        Flight::view()->assign('flats', $flats);
        Flight::view()->display('pages/flats.tpl');
    }

    public static function new_buildings()
    {
        Flight::view()->display('pages/new_buildings.tpl');
    }

    public static function suburban()
    {
        Flight::view()->display('pages/suburban.tpl');
    }

    public static function rent()
    {
        Flight::view()->display('pages/rent.tpl');
    }

    public static function commercial()
    {
        $flats = CommercialRealty::getAll();
        Flight::view()->assign('categoryID', 2);
        Flight::view()->assign('flats', $flats);
        Flight::view()->display('pages/flats.tpl');
    }
}

