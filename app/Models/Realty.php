<?php

namespace App\Models;

use App\Core\Model;
use Flight;
use PDO;

class Realty extends Model
{
    public static $table = 'realty';

    public static function getAllByTypes($types, $limit = 0, $filters = null)
    {
        $types = implode(',', $types);
        $lang = Flight::get('langID');
        $conditions = self::constructLimitation($filters);
        $sql = "SELECT * FROM realty AS r 
                LEFT JOIN realty_translations AS rt 
                  ON r.id = rt.object AND rt.lang = $lang
                WHERE r.type IN ($types)  $conditions 
                  LIMIT " . $limit[1] . " OFFSET " . $limit[0];
        return Flight::db()->query($sql)->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function countAllByTypes($types, $filters)
    {
        $types = implode(',', $types);
        $lang = Flight::get('langID');
        $conditions = self::constructLimitation($filters);
        $sql = "SELECT COUNT(*) FROM realty AS r 
                LEFT JOIN realty_translations AS rt 
                  ON r.id = rt.object AND rt.lang = $lang
                WHERE r.type IN ($types) $conditions";
        return Flight::db()->query($sql)->fetchColumn();
    }

    public static function getAllByParams($params)
    {
        return Flight::db()->select(self::$table, '*', $params);
    }

    public static function getImagesForObject($object)
    {
        return Flight::db()->get(self::$table,
            ['photos[JSON]'],
            ['id' => $object]
        )['photos'];
    }

    public static function updImagesForObject($object, $images)
    {
        Flight::db()->update(self::$table,
            ['photos' => json_encode($images, JSON_PRETTY_PRINT)],
            ['id' => $object]
        );
    }

    public static function constructLimitation($filters)
    {
        $conditions = ' ';
        if (!empty($filters['sub_type'])) {
            $sub_types = implode(',', $filters['sub_type']);
            $conditions = "AND r.sub_type IN ($sub_types) ";
        }
        if (!empty($filters['material'])) {
            $material = implode(',', $filters['material']);
            $conditions = "AND r.material IN ($material) ";
        }
        if (!empty($filters['min_floor_d'])) {
            $conditions = "AND r.floor >= ".(int)$filters['min_floor_d'].' ';
        }
        if (!empty($filters['max_floor_d'])) {
            $conditions = "AND r.floor <= ".(int)$filters['max_floor_d'].' ';
        }
        if (!empty($filters['max_floor'])) {
            $conditions = "AND r.max_floor >= ".(int)$filters['max_floor'].' ';
        }
        if (!empty($filters['heating'])) {
            $heating = implode(',', $filters['heating']);
            $conditions = "AND r.sub_type IN ($heating) ";
        }
        if (!empty($filters['min_area'])) {
            $conditions = "AND r.floor >= ".(int)$filters['min_area'].' ';
        }
        if (!empty($filters['max_area'])) {
            $conditions = "AND r.floor <= ".(int)$filters['max_area'].' ';
        }
        if (!empty($filters['new_build'])) {
            $conditions = "AND r.new_build = 1 ";
        }
        if (!empty($filters['reduced_price'])) {
            $conditions = "AND r.reduced_price = 1 ";
        }
        if (!empty($filters['superprice'])) {
            $conditions = "AND r.superprice = 1 ";
        }
        if (!empty($filters['max_floor_d'])) {
            $conditions = "AND r.floor <= ".(int)$filters['max_floor_d'].' ';
        }
        if (!empty($filters['max_floor'])) {
            $conditions = "AND r.max_floor >= ".(int)$filters['max_floor'].' ';
        }
        if (!empty($filters['suburban'])) {
            $conditions = "AND r.suburban = 1 ";
        }
        return $conditions;
    }
}
