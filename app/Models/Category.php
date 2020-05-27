<?php

namespace App\Models;

use Flight;

class Category
{
    public static function getAllByLang($lang)
    {
        return Flight::db()->select('categories',
            [
                '[>]categories_desc(cd)' => ['id' => 'category']
            ],
            [
                'categories.id', 'categories.mark',
                'cd.name',
            ],
            [
                'OR' => [
                    'cd.lang' => $lang,
                    'cd.id' => NULL,
                ]
            ]
        );
    }
}
