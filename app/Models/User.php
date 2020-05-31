<?php

namespace App\Models;

use Flight;

class User
{
    public static function getAuth($user)
    {
        return Flight::db()->get('users', '*', [
            'name' => $user['name'],
            'password' => md5($user['password'])
        ]);
    }
}
