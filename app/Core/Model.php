<?php

namespace App\Core;

use Flight;

class Model
{
    public static $table;

    public static function delete()
    {
        Flight::db()->delete(self::$table, self::$data);
    }
}
