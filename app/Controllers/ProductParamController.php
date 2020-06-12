<?php

namespace App\Controllers;

use Flight;
use App\Models\{ProductParam, Parameter};

class ProductParamController
{
    public static function listing($id)
    {
        Flight::view()->assign('productID', $id);
        Flight::view()->assign('params', ProductParam::getAllByProduct($id));
        Flight::view()->display('product_param/listing.tpl');
    }

    public static function modify($id)
    {
        if (!empty($_POST['Params'])) {
            ProductParam::$data = $_POST['Params'];
            ProductParam::$productID = $id;
            ProductParam::save();
        }
        Flight::view()->assign('params', Parameter::getAllForProduct($id));
        Flight::view()->display('product_param/modify.tpl');
    }
}
