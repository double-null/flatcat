<?php

namespace App\Models;

class ProductLoadImage
{
    public static $data;

    public static $errors;

    public static $product;

    private static $img_type;

    private static $path = 'images/objects/';

    public static function save()
    {
        $name = self::$product.time().rand(10000, 99999).'.'.self::$img_type;
        if (move_uploaded_file(self::$data['tmp_name'], self::$path.$name)) {
            return $name;
        }
    }

    public static function validate()
    {
        self::$img_type = explode('/', self::$data['type'])[1];
        if (self::$data['size'] == 0) {
            self::$errors['size'] = 'Изображение не выбрано';
        } elseif (!in_array(self::$img_type, ['jpeg', 'png'])) {
            self::$errors['type'] = 'Загружаемый файл не изображение';
        }
        return !self::$errors;
    }
}
