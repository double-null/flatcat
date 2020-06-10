<?php

namespace App\Controllers;

use Flight;
use App\Models\Category;

class CategoryController
{
    public static function create()
    {
        if (!empty($_POST['Category'])) {
            Category::$data = $_POST['Category'];
            Category::save();
            Flight::view()->assign('success', 1);
        }
        Flight::view()->display('category/create.tpl');
    }

    public static function listing()
    {
        $categories = Flight::db()->select('categories', '*');
        Flight::view()->assign('categories', $categories);
        Flight::view()->display('category/listing.tpl');
    }
}
