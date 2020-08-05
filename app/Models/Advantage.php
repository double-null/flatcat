<?php

namespace App\Models;

use App\Core\Model;
use Flight;

class Advantage extends Model
{
    public static $table = 'advantages';

    public static function getAllByLang($lang)
    {
        return Flight::db()->select(self::$table, '*', ['lang' => $lang]);
    }
}
