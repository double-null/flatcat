<?php

namespace App\Models;

use App\Core\Model;
use Flight;

class IntrumEquals extends Model
{
    public static $table = 'intrum_equals';

    public static function getObjectByIntrum($intrum, $type)
    {
        return Flight::db()->get(self::$table, ['object_id'], [
            'type' => $type,
            'intrum_id' => $intrum,
        ]);
    }
}
