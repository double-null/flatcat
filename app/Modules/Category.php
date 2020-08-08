<?php

namespace App\Modules;

use Flight;

class Category
{
    public static function create()
    {
        if (!empty($_POST['Category'])) {
            Flight::db()->insert('categories', $_POST['Category']);
            Flight::view()->assign('success', 1);
        }
        Flight::view()->display('category/desc.tpl');
    }

    public static function listing()
    {
        $categories = Flight::db()->select('categories', '*');
        Flight::view()->assign('categories', $categories);
        Flight::view()->display('category/listing.tpl');
    }

    public static function show($id)
    {
        $category = Flight::db()->get('categories', '*', ['id' => $id]);
        $cat_params = Flight::db()->select('parameters', '*', ['category' => $id]);
        $descriptions = Flight::db()->select('categories_desc', '*', ['category' => $id]);
        Flight::view()->assign('category', $category);
        Flight::view()->assign('cat_params', $cat_params);
        Flight::view()->assign('descriptions', $descriptions);
        Flight::view()->display('category/show.tpl');
    }
}
