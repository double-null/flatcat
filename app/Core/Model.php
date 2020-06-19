<?php

namespace App\Core;

use Flight;

class Model
{
    public static $table;

    public static $data;

    public static function getOneByID($id)
    {
        return Flight::db()->get(static::$table, '*', ['id' => $id]);
    }

    public static function insert()
    {
        Flight::db()->insert(static::$table, static::$data);
    }

    public static function delete()
    {
        Flight::db()->delete(static::$table, static::$data);
    }
}
