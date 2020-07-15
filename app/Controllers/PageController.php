<?php

namespace App\Controllers;

use Flight;

class PageController
{
    public static function flats()
    {
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
        Flight::view()->display('pages/commercial.tpl');
    }
}

