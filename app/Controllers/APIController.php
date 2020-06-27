<?php

namespace App\Controllers;

use App\Models\Category;
use App\Models\Intrum;
use App\Models\IntrumEquals;
use App\Models\Parameter;
use App\Models\Product;
use App\Models\ProductParam;
use App\Models\User;
use App\Models\UserProfile;

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
                $param_exist = IntrumEquals::getObjectByIntrum($parameter['id'], 2)['object_id'];
                if (!$param_exist) {
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
                    $param_id = Parameter::insert();
                    IntrumEquals::$data = [
                        'type' => 2,
                        'object_id' => $param_id,
                        'intrum_id' => $parameter['id'],
                    ];
                    IntrumEquals::insert();
                }
            }
        }
    }

    public static function updateAgents()
    {
        $agents = json_decode(json_encode(Intrum::getAgents()),true);
        foreach ($agents as $agent){
            $user_exist = IntrumEquals::getObjectByIntrum($agent['id'], 3)['object_id'];
            if (!$user_exist) {
                User::$data = [
                    'name' => $agent['name'],
                    'email' => $agent['internalemail'][0]['email'],
                    'password' => md5('1234'),
                    'role' => 2,
                    'created' => time(),
                ];
                $user_id = (int)User::insert();
                UserProfile::$data = [
                    'user' => $user_id,
                    'photo' => $agent['avatars']['original'],
                    'fullname' => $agent['surname'].' '.$agent['name'].' '.$agent['secondname'],
                    'position' => $agent['post'],
                    'phone' => $agent['mobilephone'][0]['phone'],
                    'about' => $agent['about'],
                ];
                UserProfile::insert();
                IntrumEquals::$data = [
                    'type' => 3,
                    'object_id' => $user_id,
                    'intrum_id' => $agent['id'],
                ];
                IntrumEquals::insert();
            }
        }
    }

    public static function updateProduct()
    {
        echo "<pre>";
        $category = 1;
        $products = json_decode(json_encode(Intrum::getProducts($category)),true);

        foreach ($products as $product) {
            $price_ids = [810, 470, 562, 528];
            $price = 0;
            foreach ($product['fields'] as $field) {

                $field_ids[] = $field['id'];
                //Определение поля с ценой
                if (in_array($field['id'], $price_ids)) {
                    $price = $field['value'];
                }

            }

            //Сохранение обьектов
            Product::$data = [
                'mark' => $product['id'],
                'user' => IntrumEquals::getObjectByIntrum($product['author'], 3)["object_id"],
                'name' => $product['name'],
                'short_desc' => '',
                'price' => $price,
                'category' => $category,
                'created' => strtotime($product['date_add']),
            ];
            $product_id = Product::insert();
            //Сохранение полей обьекта
            $eq = IntrumEquals::getObjectsByIntrum($field_ids, 2);
            foreach ($product['fields'] as $field) {
                ProductParam::$data = [
                    'product' => $product_id,
                    'param' => $eq[$field['id']]['object_id'],
                    'value' => $field['value'],
                ];
                ProductParam::insert();
            }
        }
    }
}
