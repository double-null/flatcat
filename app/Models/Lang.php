<?php

namespace App\Models;

class Lang
{
    public static $data = ['ge', 'en', 'ru'];

    public static function getOneByID($id)
    {
        return self::$data[$id-1];
    }
}
