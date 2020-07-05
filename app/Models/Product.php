<?php

namespace App\Models;

use App\Core\Model;
use Flight;
use Medoo\Raw;

class Product extends Model
{

    public static $table = 'products';

    public static $error;

    public static function getOneByMark($mark)
    {
        return Flight::db()->get('products',
            [
                '[>]categories(c)' => ['category' => 'id'],
                '[>]product_etc(pe)' => ['id' => 'product'],
                '[>]user_profiles(u)' => ['user' => 'user'],
            ],
            [
                'products.id', 'products.name', 'products.short_desc',
                'products.price', 'products.created', 'pe.map', 'pe.panorama',
                'pe.description', 'c.name(category)', 'c.mark(category_mark)',
                'user' => ['u.fullname', 'u.photo', 'u.position', 'u.phone'],
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

    public static function getAllForUser($user)
    {
        return Flight::db()->select('products',
            ['[><]categories' => ['category' => 'id']],
            ['products.id', 'products.mark', 'categories.mark(category)'],
            ['user' => $user]
        );
    }

    public static function getAllByCategoryName($name)
    {
        $products =  Flight::db()->select('products',
            ['[>]categories(c)' => ['category' => 'id']],
            [
                'products.id' => [
                    'products.mark', 'products.name', 'products.short_desc',
                    'products.price', 'products.created',
                ],
            ],
            ['c.mark' => $name]
        );
        $photos = Flight::db()->select('product_photos',
            ['name', 'product'],
            [
                'product' => array_keys($products),
                'ORDER' => ['product' => 'ASC'],
            ]
        );
        foreach ($photos as $photo) {
            $products[$photo['product']]['photos'][] = $photo['name'];
        }
       return $products;
    }

    public static function getAllCTPR($categoryMark, $filters)
    {
        $connector = null;
        $chunkSQL = 'WHERE';
        foreach ($filters as $param => $values) {

            $chunkSQL .= $connector . " (`pp`.`param` = $param AND `pp`.`value` IN (".implode(',',$values)."))";
            $connector = ' AND';
        }
        echo "<pre>";
        var_dump($chunkSQL);

        echo "</pre>";
        return Flight::db()->select(self::$table,
            ['[>]product_params(pp)' => ['id' => 'product']],
            ['products.mark', 'pp.value', 'pp.param'],
            Flight::db()->raw($chunkSQL)
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
        return (!self::$error);
    }
}
