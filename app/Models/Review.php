<?php

namespace App\Models;

use App\Core\Model;
use Flight;

class Review extends Model
{
    public static $table = 'reviews';

    /*
    public static function getAll()
    {
        return Flight::db()->select(self::$table,
            ['[><]user_profiles(pr)' => ['user' => 'user']],
            [
                'reviews.name', 'reviews.content', 'reviews.photos',
                'reviews.user', 'pr.fullname(agentname)',
            ]
        );
    }
    */
    public static function getAllForUser($user)
    {
        return Flight::db()->select(self::$table,
            ['name', 'content', 'photos'],
            ['user' => $user]
        );
    }

    public static function getAllForPage($limit)
    {
        return Flight::db()->select(self::$table,
            ['[>]reviews_desc(rd)' => ['id' => 'review']],
            ['reviews.user', 'reviews.photos', 'rd.name', 'rd.content'],
            [
                'rd.lang' => Flight::get('langID'),
                'ORDER' => ['reviews.id' => 'DESC'],
                'LIMIT' => $limit,
            ]
        );
    }

    public static function validate()
    {
        if (!(int)self::$data['user']) {
            self::$error = 'Агент не выбран';
        } elseif (empty(self::$data['mark'])) {
            self::$error = 'Метка не заполнена';
        }  else {
            return true;
        }
        return false;
    }
}
