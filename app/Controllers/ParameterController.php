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
        Flight::view()->display('parameter/desc.tpl');
    }

    public static function modify($id)
    {
        if (!empty($_POST['Parameter'])) {
            Parameter::$data = $_POST['Parameter'];
            Parameter::updateByID($id);
        }
        Flight::view()->assign('parameter', Parameter::getOneByID($id));
        Flight::view()->display('parameter/modify.tpl');
    }

    public static function drop()
    {
        Parameter::$data['id'] = (int)$_POST['id'];
        Parameter::delete();
        echo json_encode(['status' => 1]);
    }
}
