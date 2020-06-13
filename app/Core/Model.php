<?php

namespace App\Core;

use Flight;

class Model
{
    public static $table;

    public static $data;

    public static function delete()
    {
        Flight::db()->delete(static::$table, static::$data);
    }
}
