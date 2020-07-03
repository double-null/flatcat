<?php

namespace App\Models;

use App\Core\Model;
use Flight;

class Review extends Model
{
    public static $table = 'reviews';

    public static function validate()
    {
        if (!(int)self::$data['user']) {
            self::$error = 'Пользователь не выбран';
        } elseif (empty(self::$data['name'])) {
            self::$error = 'ФИО Клиента не заполнено';
        } elseif (empty(self::$data['content'])) {
            self::$error = 'Текст отзыва не заполнен!';
        } else {
            return true;
        }
        return false;
    }
}
