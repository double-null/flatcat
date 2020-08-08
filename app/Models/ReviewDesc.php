<?php

namespace App\Models;

use App\Core\Model;
use Flight;

class ReviewDesc extends Model
{
    public static $table = 'reviews_desc';

    public static function getAllForReview($id)
    {
        return Flight::db()->select(self::$table, '*', ['review' => $id]);
    }
}
