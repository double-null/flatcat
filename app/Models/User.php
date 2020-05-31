<?php

namespace App\Models;

use Flight;

class User
{
    public static $data;

    public static $error;

    public static function getAuth($user)
    {
        return Flight::db()->get('users', '*', [
            'name' => $user['name'],
            'password' => md5($user['password'])
        ]);
    }

    public static function getAll()
    {
        return Flight::db()->select('users', '*');
    }

    public static function exist()
    {
        return Flight::db()->has('users', ['name' => self::$data['name']]);
    }

    public static function save()
    {
        self::$data['password'] = md5(self::$data['password']);
        self::$data['created'] = time();
        Flight::db()->insert('users', self::$data);
    }

    public static function validate()
    {
        if (empty(self::$data['name'])) {
            self::$error['name'] = 'Имя не заполнено';
        } elseif (self::exist()) {
            self::$error['name'] = 'Пользователь с таким именем уже существует';
        } elseif (empty(self::$data['password'])) {
            self::$error['password'] = 'Пароль не введён';
        }
    }
}
