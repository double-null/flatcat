<?php

namespace App\Models;

use App\Core\Model;
use Flight;

class Realty extends Model
{
    public static $table = 'realty';

    public static function getOneByID($id)
    {
        return Flight::db()->get(self::$table,
            ['[><]user_profiles(u)' => ['agent' => 'user']],
            '*',
            ['realty.id' => $id]
        );
    }

    public static function getAllByTypes($types)
    {
        return Flight::db()->select(self::$table, '*', ['type' => $types]);
    }

    public static function getAllByParams($params)
    {
        return Flight::db()->select(self::$table, '*', $params);
    }
}
