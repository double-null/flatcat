<?php

namespace App\Models;

use Flight;

class ProductPhoto
{
    public static $data;

    public static function save()
    {
        Flight::db()->insert('product_photos', self::$data);
    }

    public static function getAllForProduct($product)
    {
        return Flight::db()->select('product_photos', '*', [
            'product' => $product
        ]);
    }
}
