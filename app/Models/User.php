<?php

namespace App\Models;

use App\Core\Model;
use Flight;

class User extends Model
{
    public static $table = 'users';

    public static $error;

    public static function getAuth($user)
    {
        return Flight::db()->get('users', '*', [
            'email' => $user['email'],
            'password' => md5($user['password'])
        ]);
    }

    public static function getAll()
    {
        return Flight::db()->select('users', '*');
    }

    public static function getAllWithProfile()
    {
        return Flight::db()->select(self::$table,
            ['[><]user_profiles(p)' => ['id' => 'user']],
            [
                'p.fullname', 'p.phone', 'p.position',
                'p.photo', 'users.email', 'users.id',
            ]
        );
    }

    public static function getOneWithProfile($id)
    {
        return Flight::db()->get(self::$table,
            ['[><]user_profiles(p)' => ['id' => 'user']],
            [
                'p.fullname', 'p.phone', 'p.position',
                'p.photo', 'users.email', 'users.id',
            ],
            ['users.id' => $id]
        );
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

    public static function updateAuthParams()
    {
        $validPassword = Flight::db()->has(self::$table, '*', [
            'id' => Flight::get('user_id'),
            'password' => md5(self::$data['password']),
        ]);
        if ($validPassword) {
            $updateParams = [];
            if (
                !empty(self::$data['new_password'])
                && self::$data['new_password'] == self::$data['new_repass']
            ) {
                $updateParams['password'] = md5(self::$data['new_password']);
            }
            if (!empty(self::$data['email'])) {
                $updateParams['email'] = self::$data['email'];
            }
            if (count($updateParams) > 0) {
                Flight::db()->update(self::$table, $updateParams, [
                    'id' => Flight::get('user_id')]
                );
            }
            return true;
        } else {
            return false;
        }
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
