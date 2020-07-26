<?php

namespace App\Models;

use App\Core\Model;
use Flight;

class Category extends Model
{
    public static $table = 'categories';

    public static function getAll($lang = 1)
    {
        return Flight::db()->select('categories', '*', ['lang' => $lang]);
    }

    public static function getOneByMark($mark, $lang = 1)
    {
        return Flight::db()->get('categories', 'name', [
            'AND' => ['mark' => $mark, 'lang' => $lang]
        ]);
    }
}
