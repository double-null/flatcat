<?php

namespace App\Modules;

use Flight;

class Product
{
    public static function create()
    {
        if (!empty($_POST['Product'])) {
            Flight::db()->insert('products', $_POST['Product']);
            Flight::view()->assign('success', 1);
        }
        Flight::view()->display('product/create.tpl');
    }
}
