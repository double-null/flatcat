<?php

namespace App\Models;

use App\Core\Model;
use Flight;

class UserProfile extends Model
{
    public static $table = 'user_profiles';

    public static function getOneByUser($user)
    {
        return Flight::db()->get(self::$table, '*', ['user' => $user]);
    }

    public static function save()
    {
        $condition = ['user' => self::$data['user']];
        $profileExist = Flight::db()->has(self::$table, $condition);
        if ($profileExist) {
            Flight::db()->update(self::$table, self::$data, $condition);
        } else {
            Flight::db()->insert(self::$table, self::$data);
        }
    }
}
