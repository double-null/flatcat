<?php

namespace App\Models;

use App\Core\Model;
use Flight;

class ProductPhoto extends Model
{
    public static $data;

    public static $table = 'product_photos';

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
