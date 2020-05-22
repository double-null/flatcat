<?php

namespace App\Models;

use Flight;

class ProductParam
{
   public static function save($data)
    {
        $existingParams = Flight::db()->select('product_params', 'param', [
            'AND' => [
                'product' => $data['productID'],
                'param' => array_keys($data['params']),
            ]
        ]);
        foreach ($data['params'] as $param => $value) {
            if (in_array($param, $existingParams)) {
                Flight::db()->update('product_params', ['value' => $value], [
                    'product' => $data['productID'],
                    'param' => $param,
                ]);
            } else {
                Flight::db()->insert('product_params', [
                    'product' => $data['productID'],
                    'param' => $param,
                    'value' => $value,
                ]);
            }
        }
    }
}
