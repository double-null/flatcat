<?php

namespace App\Modules;

use Flight;

class Parameter
{
    private static $error;

    public static function create()
    {
        if (!empty($_POST['Parameter'])) {
            $data = $_POST['Parameter'];
            if (self::validate($data)) {
                Flight::db()->insert('parameters', $data);
                Flight::view()->assign('success', 1);
            } else {
                Flight::view()->assign('error', self::$error);
            }
        }
        $categories = Flight::db()->select('categories', '*');
        Flight::view()->assign('categories', $categories);
        Flight::view()->display('parameter/create.tpl');
    }

    public static function listing()
    {
        $params = Flight::db()->select('parameters', '*');
        Flight::view()->assign('params', $params);
        Flight::view()->display('parameter/listing.tpl');
    }

    public static function validate($data)
    {
        if (empty($data['mark'])) {
            self::$error = 'Метка не заполнена';
        } elseif (strlen($data['mark']) > 40) {
            self::$error = 'Метка превышает 40 символов';
        } elseif (!(int)$data['category']) {
            self::$error = 'Категория не выбрана';
        } else {
            return true;
        }
        return false;
    }
}
