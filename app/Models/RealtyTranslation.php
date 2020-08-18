<?php

namespace App\Models;

use App\Core\Model;
use Flight;

class RealtyTranslation extends Model
{
    public static $table = 'realty_translations';

    public static function getAllForObject($object)
    {
        return Flight::db()->select(self::$table, '*', ['object' => $object]);
    }
}
