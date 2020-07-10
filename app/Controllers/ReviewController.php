<?php

namespace App\Controllers;

use App\Models\Review;
use App\Models\ReviewImage;
use Flight;

class ReviewController
{
    public static function create()
    {
        if (!empty($_POST['Review'])) {
            Review::$data = $_POST['Review'];
            Review::$data['user'] = Flight::get('user_id');
            if (Review::validate()) {
                foreach ($_FILES as $photo) {
                    ReviewImage::$data = $photo;
                    if (ReviewImage::validate()) {
                        $images[] = ReviewImage::save();
                    }
                }
                Review::$data['photos'] = json_encode($images);
                Review::insert();
                Flight::redirect('/admin/reviews/');
            } else {
                Flight::view()->assign('error', Review::$error);
            }
        }
        Flight::view()->display('review/create.tpl');
    }

    public static function listing()
    {
        Flight::view()->assign('reviews', Review::getAll());
        Flight::view()->display('review/listing.tpl');
    }
}
