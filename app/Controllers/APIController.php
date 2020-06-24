<?php

namespace App\Controllers;

use App\Models\Intrum;

class APIController
{
    public static function test()
    {
        $products = Intrum::getProduct();
    }

    public static function fields()
    {
        $fields = Intrum::getFields();
        echo "<pre>";
        var_dump($fields);
    }
}