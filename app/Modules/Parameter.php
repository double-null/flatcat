<?php

namespace App\Modules;

class Parameter
{
    public static function create()
    {
        if (!empty($_POST['Parameter'])) {
            Flight::db()->insert('products', $_POST['Parameter']);
            Flight::view()->assign('success', 1);
        }
        Flight::view()->display('parameter/create.tpl');
    }
}
