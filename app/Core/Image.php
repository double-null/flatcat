<?php

namespace App\Core;


class Image
{
    public static $data;

    public static $name;

    public static $type;

    public static $errors;

    public static $path;

    public static function save()
    {
        $type = (static::$type == 'jpeg') ? 'jpg' : static::$type;
        $name = static::generateName().'.'.$type;
        $filename = static::$path.$name;
        $moved = move_uploaded_file(static::$data['tmp_name'], $filename);
        return ($moved) ? $name : false;
    }

    public static function generateName()
    {
        return time().rand(100000, 999999);
    }

    public static function validate()
    {
        static::$type = explode('/', static::$data['type'])[1];
        if (static::$data['size'] == 0) {
            static::$errors['size'] = 'Изображение не выбрано';
        } elseif (!in_array(static::$type, ['jpeg', 'png'])) {
            static::$errors['type'] = 'Загружаемый файл не изображение';
        }
        return !static::$errors;
    }

    public static function drop($img_name)
    {
        $fn = $_SERVER['DOCUMENT_ROOT'].'/'.static::$path.$img_name;
        if (file_exists($fn)) { unlink($fn); }
    }
}
