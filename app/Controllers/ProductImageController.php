<?php

namespace App\Controllers;

use Flight;
use App\Models\{ProductPhoto, ProductLoadImage};

class ProductImageController
{
    public static function listing($id)
    {
        Flight::view()->assign('productID', $id);
        Flight::view()->display('product_image/listing.tpl');
    }

    public static function create($id)
    {
        if (!empty($_FILES)) {
            foreach ($_FILES as $photo) {
                ProductLoadImage::$data = $photo;
                ProductLoadImage::$product = $id;
                if (ProductLoadImage::validate()) {
                    $name = ProductLoadImage::save();
                    ProductPhoto::$data = [
                        'product' => $id,
                        'name' => $name,
                    ];
                    ProductPhoto::save();
                } else {

                }
            }
        }
        Flight::view()->display('product_image/create.tpl');
    }
}
