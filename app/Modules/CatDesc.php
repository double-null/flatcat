<?php

namespace App\Modules;

use Flight;

class CatDesc
{
    public static $category;

    public static $error;

    public static function create()
    {
        if (!empty($_POST['Desc'])) {
            $data = $_POST['Desc'];
            if (self::validation($data)) {
                $data['category'] = self::$category;
                Flight::db()->insert('categories_desc', $data);
                Flight::view()->assign('success', 1);
            } else {
                Flight::view()->assign('error', self::$error);
            }
        }
        Flight::view()->display('cat_desc/create.tpl');
    }

    public static function listing()
    {
        $descriptions = Flight::db()->select('categories_desc', '*',
            ['category' => self::$category]
        );
        Flight::view()->assign('categoryID', self::$category);
        Flight::view()->assign('descriptions', $descriptions);
        Flight::view()->display('cat_desc/listing.tpl');
    }

    public static function validation($data)
    {
        if (empty($data['name'])) {
            self::$error = 'Название не заполнено';
        } elseif (strlen($data['name']) > 40) {
            self::$error = 'Название превышает 40 символов';
        } elseif (!(int)$data['lang']) {
            self::$error = 'Язык не выбран!';
        } else {
            return true;
        }
        return false;
    }
}
