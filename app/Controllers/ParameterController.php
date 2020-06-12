<?php

namespace App\Controllers;

use App\Models\Parameter;
use App\Models\Product;
use Flight;

class ParameterController
{
    public static function create($category)
    {
        if (!empty($_POST['Parameter'])) {
            Parameter::$data = array_merge(
                $_POST['Parameter'], ['category' => $category]
            );
            Parameter::save();
        }
        Flight::view()->display('parameter/create.tpl');
    }
}
