<?php

namespace App\Models;

use App\Core\Model;
use Flight;

class UserDesc extends Model
{
    public static $table = 'users_desc';

    public static function getAllByUser($user)
    {
        return Flight::db()->select(self::$table, '*', ['user' => $user]);
    }
}
