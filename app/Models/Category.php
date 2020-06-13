<?php

namespace App\Models;

use App\Core\Model;
use Flight;

class Category extends Model
{
    public static $table = 'categories';

    public static function save()
    {
        Flight::db()->insert('categories', self::$data);
    }

    public static function getAll()
    {
        return Flight::db()->select('categories', '*');
    }

    public static function getOneByMark($mark)
    {
        return Flight::db()->get('categories', '*', ['mark' => $mark]);
    }
}
