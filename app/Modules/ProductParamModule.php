<?php

namespace App\Modules;

use Flight;

class ProductParamModule
{
    public static $id;

    public static function create()
    {

        Flight::view()->display('product_param/create.tpl');
    }

    public static function listing()
    {
        Flight::view()->display('product_param/listing.tpl');
    }
}
