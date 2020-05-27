<?php

namespace App\Modules;

use Flight;
use App\Models\Category;

class Application
{
    public static function start()
    {
        $categories = Category::getAllByLang(1);
        Flight::view()->assign('categories', $categories);
    }
}