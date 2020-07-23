<?php

namespace App\Models;

use App\Core\Model;
use Flight;

class Block extends Model
{
    public static $table = 'blocks';

    public static function getAllByLang($lang)
    {
        return Flight::db()->select(self::$table,
            ['name' => ['code[JSON]']],
            ['lang' => $lang]
        );
    }

    public static function getOneByID($id)
    {
        return Flight::db()->get(self::$table, ['code[JSON]'], ['id' => $id]);
    }

    public static function getOneByParams($params)
    {
        return Flight::db()->get(self::$table, ['code[JSON]'], $params)['code'];
    }
}
