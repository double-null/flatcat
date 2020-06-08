<?php

namespace App\Controllers;

use App\Models\ProductEtc;
use Flight;

use App\Models\{Product, ProductPhoto, ProductParam, Category};

class ProductController
{
    public static function create()
    {
        if (!empty($_POST['Product'])) {
            Product::$data = $_POST['Product'];
            if (Product::validate()) {
                Product::save();
                Flight::redirect('/admin/products/');
            } else {
                Flight::view()->assign('error', self::$error);
            }
        }
        $categories = Category::getAllByLang(1);
        Flight::view()->assign('categories', $categories);
        Flight::view()->display('product/create.tpl');
    }

    public static function listingForCategory($category)
    {
        $category = Category::getOneByMark($category);
        $products = Product::getAllByCategoryName($category);
        Flight::view()->assign('category', $category);
        Flight::view()->assign('products', $products);
        Flight::view()->display('product/listing.tpl');
    }

    public static function show($product_mark)
    {
        $product = Product::getOneByMark($product_mark);
        $product_photos = ProductPhoto::getAllForProduct($product['id']);
        $product_params = ProductParam::getAllByProduct($product['id']);
        $categories = Category::getAllByLang(1);
        Flight::view()->assign('categories', $categories);
        Flight::view()->assign('product', $product);
        Flight::view()->assign('product_photos', $product_photos);
        Flight::view()->assign('product_params', $product_params);
        Flight::view()->display('product/show.tpl');
    }
}
