<?php

namespace App\Controllers;

use App\Models\Category;
use App\Models\CommercialRealty;
use App\Models\Flat;
use App\Models\Intrum;
use App\Models\IntrumEquals;
use App\Models\Parameter;
use App\Models\Product;
use App\Models\ProductParam;
use App\Models\ProductPhoto;
use App\Models\Realty;
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

    public static function updateProduct($category)
    {
        ini_set('max_execution_time', 600);
        $products = json_decode(json_encode(Intrum::getProducts($category   )),true);

        foreach ($products as $product) {
            $eq = IntrumEquals::getObjectsByIntrum($product['id'],4);
            if (!$eq) {
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
                        case 546: $params['unit_price'] = $field['value']; break;
                        case 855: $params['unit_price'] = $field['value']; break;
                        case 856: $params['unit_price'] = $field['value']; break;
                        case 744: $params['animals'] = $field['value']; break;
                        case 743: $params['children'] = $field['value']; break;
                        case 486: $params['distance_metro'] = $field['value']; break;
                        case 570: $params['distance_metro'] = $field['value']; break;
                        case 517: $params['distance_metro'] = $field['value']; break;
                        case 460: $params['distance_sea'] = $field['value']; break;
                        case 519: $params['distance_sea'] = $field['value']; break;
                        case 461: $params['heating'] = $field['value']; break;
                        case 499: $params['heating'] = $field['value']; break;
                        case 778:
                            if ($field['value'] == 'სახლი') $params['type'] = 3; // Дом
                            if ($field['value'] == 'აგარაკი') $params['type'] = 4; //Дача
                            if ($field['value'] == 'კოტეჯი') $params['type'] = 5; // Коттедж
                            if ($field['value'] == 'სახლის ნაწილი') $params['type'] = 6; // Часть дома
                            if ($field['value'] == 'ნაკვეთი') $params['type'] = 7; // Участок
                            break;
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
                Realty::$data = $params;
                $object_id = Realty::insert();

                IntrumEquals::$data = [
                    'type' => 4,
                    'object_id' => $object_id,
                    'intrum_id' => $product['id'],
                ];
                IntrumEquals::insert();
            }
        }
    }
}
