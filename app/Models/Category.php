<?php

namespace App\Models;

use Flight;

class Category
{
    public static $data;

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

    public static function delete()
    {
        Flight::db()->delete('categories', self::$data);
    }
}
