<?php

namespace App\Models;

use App\Core\Model;
use Flight;

class Filter extends Model
{
    public static $table = 'filters';

    public static function getAll()
    {
        return Flight::db()->select(self::$table,
            ['mark' => ['value', 'additional']],
            ['lang' => Flight::get('langID')]
        );
    }
}
