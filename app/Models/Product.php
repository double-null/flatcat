<?php

namespace App\Models;

use Flight;

class Product
{
    public static $data;

    public static $error;

    public static function getOneByMark($mark)
    {
        return Flight::db()->get('products',
            [
                '[>]categories(c)' => ['category' => 'id'],
                '[>]product_etc(pe)' => ['id' => 'product'],
            ],
            [
                'products.id', 'products.name', 'products.short_desc',
                'products.price', 'products.created', 'pe.map', 'pe.panorama',
                'pe.description', 'c.name(category)', 'c.mark(category_mark)',
            ],
            [
                'products.mark' => $mark,
            ]
        );
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
