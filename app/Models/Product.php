<?php

namespace App\Models;

use App\Core\Model;
use Flight;
use PDO;

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
        $photos = ProductPhoto::getAllForProduct(array_keys($products));
        foreach ($photos as $photo) {
            $products[$photo['product']]['photos'][] = $photo['name'];
        }
       return $products;
    }

    public static function getAllByIDs($ids)
    {
        $products = Flight::db()->select(self::$table, '*', ['id' => $ids]);
        if ($products) {
            $photos = ProductPhoto::getAllForProduct(array_keys($products));
            foreach ($photos as $photo) {
                $products[$photo['product']]['photos'][] = $photo['name'];
            }
        }
        return $products;
    }

    public static function getIDsByFilter($filters)
    {
        $condition= '';
        if ($filters) {
            $connector = 'WHERE ';
            foreach ($filters as $param => $values) {
                $condition .= $connector."(param = $param AND value IN (".implode(',', $values)."))";
                $connector = "OR ";
            }
        }
        $sql = 'SELECT * FROM product_params '.$condition.' ORDER BY product';
        $params = Flight::db()->query($sql)->fetchAll(PDO::FETCH_ASSOC);

        // Формирование массива продуктов с вложенными характеристиками
        $products = [];
        foreach ($params as $param) {
            $products[$param['product']][] = [$param['param'] => $param['value']];
        }

        // Формирование списка ID продуктов соответствующих фильтру
        $out = [];
        $totalFilters = count($filters);
        foreach ($products as $id => $product) {
            // Сравнение количества подходящих характеристик у продуктов с количеством фильтров
            if (count($product) == $totalFilters) {
                $out[] = $id;
            }
        }

        return $out;
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
