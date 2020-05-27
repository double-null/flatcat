<?php

namespace App\Modules;

use Flight;

class Page
{
    public static function main()
    {
        Flight::view()->display('pages/main.tpl');
    }
}