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
        Flight::view()->display('category/create.tpl');
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
        Flight::view()->assign('category', $category);
        Flight::view()->display('category/show.tpl');
    }
}
