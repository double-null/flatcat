<?php

namespace App\Models;

use Flight;

class Product
{
    public static function getAllWithCategory()
    {
        return Flight::db()->select('products',
            ['[><]categories' => ['category' => 'id']],
            ['products.id', 'products.mark', 'categories.mark(category)']
        );
    }
}
