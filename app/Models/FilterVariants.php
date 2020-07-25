<?php

namespace App\Models;

use App\Core\Model;
use Flight;

class FilterVariants extends Model
{
    public static $table = 'filter_variants';

    public static function getAllByFilters($filters)
    {
        $variants = Flight::db()->select(self::$table,
            ['id', 'filter', 'variant', 'value'],
            ['filter' => $filters]
        );
        $out = [];
        foreach ($variants as $variant) {
            $out[$variant['filter']][] = [
                'id' => $variant['variant'],
                'value' => $variant['value'],
            ];
        }
        return $out;
    }
}
