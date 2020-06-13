<?php

namespace App\Controllers;

use Flight;
use App\Models\ProductEtc;

class ProductEtcController
{
    public static function listing()
    {
        Flight::view()->display('product_etc/listing.tpl');
    }

    public static function create($id)
    {
        if (!empty($_POST['Code'])) {
            ProductEtc::$data = $_POST['Code'];
            ProductEtc::save();
        }
        Flight::view()->assign('productID', $id);
        Flight::view()->display('product_etc/create.tpl');
    }
}