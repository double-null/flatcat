<?php

namespace App\Models;

use Flight;

class Parameter
{
    public static $data;

    public static function getAllForProduct($product)
    {
        return Flight::db()->select('parameters',
            [
                '[>]products' => ['category' => 'category'],
                '[>]product_params' => ['id' => 'param'],
            ],
            [
                'parameters.id', 'parameters.mark(param)',
                'parameters.name', 'product_params.value'
            ],
            [
                'products.id' => $product,
            ]
        );
    }

    public static function save()
    {
        $options = explode("\r\n", self::$data['options']);
        foreach ($options as $option) {
            $out[] = trim($option);
        }
        self::$data['options'] = json_encode($out);
        Flight::db()->insert('parameters', self::$data);
    }
}
