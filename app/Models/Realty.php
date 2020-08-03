<?php

namespace App\Models;

use App\Core\Model;
use Flight;

class Realty extends Model
{
    public static $table = 'realty';

    public static function getOneByID($id)
    {
        return Flight::db()->get(self::$table,
            ['[><]user_profiles(u)' => ['agent' => 'user']],
            '*',
            ['realty.id' => $id]
        );
    }

    public static function getAllByTypes($types, $limit = 0, $filters = null)
    {
        $a = self::constructLimitation($filters);
        if (count($a) > 0) {
            $where = [
                'AND' => array_merge($a, ['type' => $types]),
                'LIMIT' => $limit,
            ];
        } else {
            $where = ['type' => $types, 'LIMIT' => $limit];
        }
        return Flight::db()->select(self::$table, '*', $where);
    }

    public static function countAllByTypes($types, $filters)
    {
        $a = self::constructLimitation($filters);
        if (count($a) > 0) {
            $where = [
                'AND' => array_merge($a, ['type' => $types]),
            ];
        } else {
            $where = ['type' => $types];
        }
        return Flight::db()->count(self::$table, $where);
    }

    public static function getAllByParams($params)
    {
        return Flight::db()->select(self::$table, '*', $params);
    }

    public static function constructLimitation($filters)
    {
        $a = [];
        if (!empty($filters['rooms'])) {$a['rooms'] = $filters['rooms'];}
        if (!empty($filters['min_floor_d'])) {$a['floor[>=]'] = $filters['min_floor_d'];}
        if (!empty($filters['max_floor_d'])) {$a['floor[<=]'] = $filters['max_floor_d'];}
        if (!empty($filters['max_floor'])) {$a['max_floor[>=]'] = $filters['max_floor'];}
        if (!empty($filters['material'])) {$a['material'] = $filters['material'];}
        if (!empty($filters['min_area'])) {$a['area_total[>=]'] = $filters['min_area'];}
        if (!empty($filters['max_area'])) {$a['area_total[<=]'] = $filters['max_area'];}
        if (!empty($filters['new_build'])) {$a['new_building'] = $filters['new_build'];}
        if (!empty($filters['reduced_price'])) {$a['reduced_price'] = $filters['reduced_price'];}
        if (!empty($filters['superprice'])) {$a['superprice'] = $filters['superprice'];}
        if (!empty($filters['min_price'])) {$a['price[>=]'] = $filters['min_price'];}
        if (!empty($filters['max_price'])) {$a['price[<=]'] = $filters['max_price'];}
        return $a;
    }
}
