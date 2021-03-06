<?php

namespace App\Models;

use App\Core\Model;
use Flight;

class Review extends Model
{
    public static $table = 'reviews';

    public static function getAllForPublic()
    {
        return Flight::db()->select(self::$table,
            [
                '[>]reviews_desc(rd)' => ['id' => 'review'],
                '[>]users_desc(ud)' => ['user' => 'user'],
            ],
            [
                'reviews.photos', 'rd.content', 'rd.name',
                'reviews.user', 'ud.fullname(agentname)',
            ],
            [
                'rd.lang' => Flight::get('langID'),
                'ud.lang' => Flight::get('langID'),
            ]
        );
    }

    public static function getAllForUser($user)
    {
        return Flight::db()->select(self::$table,
            [
                '[>]reviews_desc(rd)' => ['id' => 'review'],
            ],
            ['reviews.user', 'rd.name', 'rd.content', 'reviews.photos'],
            [
                'reviews.user' => $user,
                'rd.lang' => Flight::get('langID'),
            ]
        );
    }

    public static function getAllForPage($limit)
    {
        return Flight::db()->select(self::$table,
            [
                '[>]reviews_desc(rd)' => ['id' => 'review'],
                '[>]users_desc(ud)' => ['user' => 'user'],
            ],
            [
                'reviews.user', 'reviews.photos', 'rd.name',
                'rd.content', 'ud.fullname(agentname)',
            ],
            [
                'rd.lang' => Flight::get('langID'),
                'ud.lang' => Flight::get('langID'),
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
