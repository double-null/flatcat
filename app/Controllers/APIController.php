<?php

namespace App\Controllers;

use App\Models\Category;
use App\Models\Flat;
use App\Models\Intrum;
use App\Models\IntrumEquals;
use App\Models\Parameter;
use App\Models\Product;
use App\Models\ProductParam;
use App\Models\ProductPhoto;
use App\Models\User;
use App\Models\UserProfile;
use Flight;

class APIController
{
    public static function updateCategories()
    {
        $object_type = 1;
        $categories = Intrum::getCategories();
        foreach ($categories as $category) {
            $categoryID = IntrumEquals::getObjectByIntrum((int)$category->id, $object_type)['object_id'];
            Category::$data = [
                'mark' => $category->id,
                'name' => $category->name,
            ];
            if (!$categoryID) {
                IntrumEquals::$data = [
                    'type' => $object_type,
                    'object_id' => Category::insert(),
                    'intrum_id' => $category->id,
                ];
                IntrumEquals::insert();
            } else {
                Category::updateByID($categoryID);
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
                $paramID = IntrumEquals::getObjectByIntrum($parameter['id'], 2)['object_id'];
                if (!$paramID) {
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
            $userID = IntrumEquals::getObjectByIntrum($agent['id'], 3)['object_id'];
            if (!$userID) {
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

    public static function updateProduct($category)
    {

        $products = json_decode(json_encode(Intrum::getProducts($category)),true);

        foreach ($products as $product) {

            $productID = IntrumEquals::getObjectByIntrum($product['id'], 4)['object_id'];
            if (!$productID) {
                $price_ids = [810, 470, 562, 528];
                $price = 0;
                foreach ($product['fields'] as $field) {

                    $field_ids[] = $field['id'];
                    //Определение поля с ценой
                    if (in_array($field['id'], $price_ids)) {
                        $price = $field['value'];
                    }

                }

                //Сохранение обьекта
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

                //Сохранение в таблицу соответствий
                IntrumEquals::$data = [
                    'type' => 4,
                    'object_id' => $product_id,
                    'intrum_id' => $product['id'],
                ];
                IntrumEquals::insert();

                //Сохранение полей обьекта
                $eq = IntrumEquals::getObjectsByIntrum($field_ids, 2);
                foreach ($product['fields'] as $field) {

                    if ($field['type'] == 'file') {
                        $fn1 = 'https://iyidebabina.intrumnet.com/files/crm/product/'.$field['value'];
                        $fn2 = 'https://iyidebabina.intrumnet.com/files/crm/product/resized200x200/'.$field['value'];
                        $fi = explode('.', $field['value']);
                        $file1 = file_get_contents($fn1);
                        $file2 = file_get_contents($fn2);
                        $name = md5($fi[0]).'.'.$fi[1];
                        $new_file = $_SERVER['DOCUMENT_ROOT'].'/images/objects/original/'.$name;
                        $new_mini_file = $_SERVER['DOCUMENT_ROOT'].'/images/objects/mini/'.$name;
                        file_put_contents($new_file, $file1);
                        file_put_contents($new_mini_file, $file2);
                        ProductPhoto::$data = [
                            'product' => $product_id,
                            'name' => $name,
                        ];
                        ProductPhoto::insert();
                    } else {
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
    }

    public static function starter()
    {
        if (!empty($_POST['Intrum'])) {
            ini_set('max_execution_time', 600);
            $data = $_POST['Intrum'];
            if (!empty($data['category'])) {
                self::updateProduct((int)$data['category']);
            }
            if (!empty($data['fields'])) {
                self::updateFields();
            }
            if (!empty($data['agents'])) {
                self::updateAgents();
            }
            if (!empty($data['categories'])) {
                self::updateCategories();
            }
            Flight::view()->assign('success', 1);
        }
        Flight::view()->assign('categories', Category::getAll());
        Flight::view()->display('intrum/starter.tpl');
    }

    public static function test()
    {
        $category = 1;
        $products = json_decode(json_encode(Intrum::getProducts($category   )),true);
        foreach ($products as $product) {
            $params = [];
            $params['deal'] = $product['stock_type'];
            $params['type'] = $category;
            $params['agent'] = $product['author'];
            $params['name'] = $product['name'];
            $params['created'] = strtotime($product['date_add']);
            foreach ($product['fields'] as $field) {
                switch ($field['id']) {
                    case 530: $params['rooms'] = $field['value']; break;
                    case 446: $params['rooms'] = $field['value']; break;
                    case 506: $params['floor'] = $field['value']; break;
                    case 408: $params['floor'] = $field['value']; break;
                    case 467: $params['max_floor'] = $field['value']; break;
                    case 493: $params['max_floor'] = $field['value']; break;
                    case 816: $params['max_floor'] = $field['value']; break;
                    case 458: $params['material'] = $field['value']; break;
                    case 447: $params['area_total'] = $field['value']; break;
                    case 1154: $params['area_total'] = $field['value']; break;
                    case 450: $params['area_live'] = $field['value']; break;
                    case 451: $params['area_kitchen'] = $field['value']; break;
                    case 562: $params['price'] = $field['value']; break;
                    case 528: $params['price'] = $field['value']; break;
                    case 810: $params['price'] = $field['value']; break;
                    case 470: $params['price'] = $field['value']; break;
                    case 624: $params['description'] = $field['value']; break;
                    case 811: $params['money_type'] = $field['value']; break;
                    case 492: $params['money_type'] = $field['value']; break;
                    case 471: $params['money_type'] = $field['value']; break;
                    case 563: $params['money_type'] = $field['value']; break;
                    case 529: $params['money_type'] = $field['value']; break;
                    case 546: $params['price_sm'] = $field['value']; break;
                    case 855: $params['price_sm'] = $field['value']; break;
                    case 856: $params['price_sm'] = $field['value']; break;
                    case 744: $params['animals'] = $field['value']; break;
                    case 743: $params['children'] = $field['value']; break;
                    case 486: $params['metro'] = $field['value']; break;
                    case 570: $params['metro'] = $field['value']; break;
                    case 517: $params['metro'] = $field['value']; break;
                    case 460: $params['water'] = $field['value']; break;
                    case 519: $params['water'] = $field['value']; break;
                    case 461: $params['heating'] = $field['value']; break;
                    case 499: $params['heating'] = $field['value']; break;
                }
                if ($field['type'] == 'file') {
                    $fn1 = 'https://iyidebabina.intrumnet.com/files/crm/product/'.$field['value'];
                    $fn2 = 'https://iyidebabina.intrumnet.com/files/crm/product/resized200x200/'.$field['value'];
                    $fi = explode('.', $field['value']);
                    $file1 = file_get_contents($fn1);
                    $file2 = file_get_contents($fn2);
                    $name = md5($fi[0]).'.'.$fi[1];
                    $new_file = $_SERVER['DOCUMENT_ROOT'].'/images/objects/original/'.$name;
                    $new_mini_file = $_SERVER['DOCUMENT_ROOT'].'/images/objects/mini/'.$name;
                    file_put_contents($new_file, $file1);
                    file_put_contents($new_mini_file, $file2);
                    $params['photos'][] = $name;
                }
            }
            $params['photos'] = json_encode($params['photos']);
            Flat::$data = $params;
            Flat::insert();
        }

        /*

        $fields = Intrum::getFields();
        $fields = json_decode(json_encode($fields),true);
        foreach ($fields as $field) {
            foreach ($field as $field_src) {

                var_dump($field_src);

            }
        }
        */
    }
}
