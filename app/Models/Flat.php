<?php

namespace App\Models;

use App\Core\Model;
use Flight;

class Flat extends Model
{
    public static $table = 'flats';

    public static function getOneByID($id)
    {
        return Flight::db()->get(self::$table,
            ['[><]user_profiles(u)' => ['agent' => 'user']],
            '*',
            ['flats.id' => $id]
        );
    }
}
