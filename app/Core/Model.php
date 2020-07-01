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

    public static function updateByID($id)
    {
        Flight::db()->update(static::$table, static::$data, ['id' => $id]);
    }

    public static function insert()
    {
        Flight::db()->insert(static::$table, static::$data);
        return Flight::db()->id();
    }

    public static function delete()
    {
        Flight::db()->delete(static::$table, static::$data);
    }
}
