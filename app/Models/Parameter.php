<?php

namespace App\Models;

use App\Core\Model;
use Flight;

class Parameter extends Model
{
    public static $table = 'parameters';

    public static function getAllForProduct($product)
    {
        return Flight::db()->select('parameters',
            [
                '[>]products' => ['category' => 'category'],
                '[>]product_params' => ['id' => 'param'],
            ],
            [
                'parameters.id', 'parameters.mark(param)',
                'parameters.name', 'parameters.type',
                'parameters.options[JSON]', 'product_params.value',
            ],
            [
                'products.id' => $product,
            ]
        );
    }

    public static function getAllByCategory($category)
    {
        return Flight::db()->select(self::$table, '*', ['category' => $category]);
    }

    public static function updateByID($id)
    {
        $options = explode("\r\n", self::$data['options']);
        foreach ($options as $option) {
            if (!empty(trim($option))) {
                $out[] = trim($option);
            }
        }
        self::$data['options'] = json_encode($out);
        parent::updateByID($id);
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
