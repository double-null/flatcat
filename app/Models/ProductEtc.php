<?php

namespace App\Models;

use App\Core\Model;
use Flight;

class ProductEtc extends Model
{
    public static $table = 'product_etc';

    public static function save()
    {
        Flight::db()->insert(self::$table, self::$data);
    }

    public static function getForProduct($product)
    {
        Flight::db()->get(self::$table, '*', ['product' => $product]);
    }
}
