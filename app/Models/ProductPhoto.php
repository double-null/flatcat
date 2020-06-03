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
}
