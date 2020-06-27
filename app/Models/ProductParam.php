<?php

namespace App\Models;

use App\Core\Model;
use Flight;

class ProductParam extends Model
{
    public static $table = 'product_params';

    public static $productID;

    public static function save()
    {
        $existingParams = Flight::db()->select('product_params', 'param', [
            'AND' => [
                'product' => self::$productID,
                'param' => array_keys(self::$data),
            ]
        ]);
        foreach (self::$data as $param => $value) {
            if (in_array($param, $existingParams)) {
                Flight::db()->update('product_params', ['value' => $value], [
                    'product' => self::$productID,
                    'param' => $param,
                ]);
            } else {
                Flight::db()->insert('product_params', [
                    'product' => self::$productID,
                    'param' => $param,
                    'value' => $value,
                ]);
            }
        }
    }

    public static function getAllByProduct($product)
    {
        return Flight::db()->select('product_params',
            [
                '[>]parameters' => ['param' => 'id'],
            ],
            [
                'product_params.param', 'product_params.value',
                'parameters.name', 'parameters.mark', 'product_params.id',
            ],
            [
                'product' => $product
            ]
        );
    }

    public static function update()
    {
        foreach (self::$data as $param => $value) {
            Flight::db()->update('product_params',
                ['value' => $value],
                [
                    'param' => $param,
                    'product' => self::$productID
                ]
            );
        }
    }
}
