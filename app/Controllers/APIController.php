<?php

namespace App\Controllers;

use App\Models\Category;
use App\Models\Intrum;
use App\Models\IntrumEquals;
use App\Models\Parameter;
use function PHPSTORM_META\type;

class APIController
{
    public static function test()
    {
        $products = Intrum::getProduct();
    }

    public static function updateCategories()
    {
        $object_type = 1;
        $categories = Intrum::getCategories();
        foreach ($categories as $category) {
            $category_exist = IntrumEquals::getObjectByIntrum((int)$category->id, $object_type);
            if (!$category_exist) {
                Category::$data = [
                    'mark' => $category->id,
                    'name' => $category->name,
                ];
                IntrumEquals::$data = [
                    'type' => $object_type,
                    'object_id' => Category::insert(),
                    'intrum_id' => $category->id,
                ];
                IntrumEquals::insert();
            }
        }
    }

    public static function updateFields()
    {
        echo "<pre>";
        $object_type = 2;
        $fields = Intrum::getFields();
        $fields = json_decode(json_encode($fields),true);
        $types = [
            'radio' => 2,
            'select' => 3,
            'multiselect' => 4,
            'text' => 5,
            'file' => 6,
        ];
        foreach ($fields as $category => $parameters) {
            $category_id = IntrumEquals::getObjectByIntrum((int)$category, 1)['object_id'];

            foreach ($parameters['fields'] as $parameter) {
                $type = $types[$parameter['datatype']] ?? 1;
                $options = [];
                if ($type == 3 || $type == 4) {
                    foreach ($parameter['variants'] as $variant) {
                        $options[] = $variant['value'];
                    }
                }

                Parameter::$data = [
                    'category' => $category_id,
                    'mark' => $parameter['id'],
                    'name' => $parameter['name'],
                    'type' => $type,
                    'options' => json_encode($options),
                ];
                Parameter::insert();
            }
        }
    }
}
