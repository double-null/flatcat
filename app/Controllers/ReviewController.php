<?php

namespace App\Controllers;

use App\Models\Review;
use App\Models\ReviewDesc;
use App\Models\ReviewImage;
use App\Models\User;
use App\Models\Category;
use Flight;

class ReviewController
{
    public static function create()
    {
        if (!empty($_POST['Review'])) {
            Review::$data = $_POST['Review'];
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
        Flight::view()->assign('agents', User::getAll());
        Flight::view()->display('review/desc.tpl');
    }

    public static function show()
    {
        $review = Review::getOneByID((int)$_GET['id']);
        $descs = ReviewDesc::getAllForReview((int)$_GET['id']);
        Flight::view()->assign('review', $review);
        Flight::view()->assign('review_descs', $descs);
        Flight::view()->display('review/show.tpl');
    }

    public static function desc()
    {
        if (!empty($_POST['Review'])) {
            $reviewID =(int)$_GET['review'];
            ReviewDesc::$data = $_POST['Review'];
            ReviewDesc::$data['review'] = $reviewID;
            if (ReviewDesc::insert()) {
                Flight::redirect('/admin/review/show/?id='.$reviewID);
            }
        }
        Flight::view()->display('review/desc.tpl');
    }

    public static function desc_drop()
    {
        if (!empty($_POST['id'])) {
            ReviewDesc::$data['id'] = (int)$_POST['id'];
            ReviewDesc::delete();
            Flight::json(['status' => 1]);
        } else {
            Flight::json(['status' => 0]);
        }
    }

    public static function listing()
    {
        Flight::view()->assign('reviews', Review::getAll());
        Flight::view()->display('review/listing.tpl');
    }

    public static function publicListing()
    {
        Flight::view()->assign('categoryName', Category::getOneByMark(7));
        Flight::view()->assign('reviews', Review::getAllForPublic());
        Flight::view()->display('review/listing.tpl');
    }
}
