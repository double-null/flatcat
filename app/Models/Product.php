<?php

namespace App\Models;

use Flight;

class Product
{
    public static $data;

    public static $error;

    public static function getOneByMark($mark)
    {
        var_dump($mark);
    }

    public static function getAllWithCategory()
    {
        return Flight::db()->select('products',
            ['[><]categories' => ['category' => 'id']],
            ['products.id', 'products.mark', 'categories.mark(category)']
        );
    }

    public static function getAllByCategoryName($name)
    {
        return Flight::db()->select('products',
            ['[>]categories(c)' => ['category' => 'id']],
            [
                'products.mark', 'products.name', 'products.short_desc',
                'products.price', 'products.created'
            ],
            [
                'c.mark' => $name,
            ]
        );
    }

    public static function save()
    {
        self::$data['user'] = Flight::get('user_id');
        self::$data['created'] = time();
        Flight::db()->insert('products', self::$data);
    }

    public static function validate()
    {
        var_dump(self::$data);
        return (!self::$error);
    }
}
