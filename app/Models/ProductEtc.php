<?php

namespace App\Models;

use Flight;

class ProductEtc
{
    public static $data;

    public static function save()
    {
        Flight::db()->insert('product_etc', self::$data);
    }

    public static function getForProduct()
    {

    }
}
