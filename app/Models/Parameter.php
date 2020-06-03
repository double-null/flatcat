<?php

namespace App\Models;

use Flight;

class Parameter
{
    public static function getAllForProduct($product, $lang)
    {
        return Flight::db()->select('parameters',
            [
                '[>]products' => ['category' => 'category'],
            ],
            [
                'parameters.id', 'parameters.mark(param)',
                'parameters.name',
            ],
            [
                'products.id' => $product,
            ]
        );
    }
}
