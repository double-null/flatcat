<?php

namespace App\Models;

use Flight;

class Parameter
{
    public static function getAllForProduct($product, $lang)
    {
        return Flight::db()->select('parameters',
            [
                '[>]parameters_desc(p_d)' => ['id' => 'parameter'],
                '[>]products' => ['category' => 'category'],
            ],
            [
                'parameters.id', 'parameters.mark(param)',
                'name' => Flight::db()->raw('IFNULL(<p_d.name>,<parameters.mark>)'),
            ],
            [
                'products.id' => $product,
                'OR' => [
                    'p_d.lang' => $lang,
                    'p_d.name' => NULL,
                ]
            ]
        );
    }
}
