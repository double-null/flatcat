<?php

namespace App\Modules;

use Flight;
use App\Models\{Parameter, ProductParam};

class ProductParamModule
{
    public static $id;

    public static function create()
    {
        if (!empty($_POST['Params'])) {
            $data = [
                'params' => $_POST['Params'],
                'productID' => self::$id,
            ];
            ProductParam::save($data);
        }
        $params = Parameter::getAllForProduct(self::$id, 1);
        Flight::view()->assign('params', $params);
        Flight::view()->display('product_param/create.tpl');
    }

    public static function listing()
    {
        Flight::view()->assign('productID', self::$id);
        Flight::view()->display('product_param/listing.tpl');
    }
}
