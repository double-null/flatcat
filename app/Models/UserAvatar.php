<?php

namespace App\Models;

use App\Core\Image;
use Flight;

class UserAvatar extends Image
{
    public static $path = 'images/users/';

    public static function generateName()
    {
        return Flight::get('user_id');
    }
}
