<?php

namespace App\Controllers;

use App\Models\Parameter;
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
        $categories = Category::getAll();
        Flight::view()->assign('categories', $categories);
        Flight::view()->display('product/create.tpl');
    }

    public static function listing()
    {
        if (Flight::get('user_role') == 1) {
            $products = Product::getAllWithCategory();
        } elseif (Flight::get('user_role') == 2) {
            $products = Product::getAllForUser(Flight::get('user_id'));
        } else {
            $products = null;
        }
        Flight::view()->assign('products', $products);
        Flight::view()->display('product/listing.tpl');
    }

    public static function listingForCategory($categoryMark)
    {
        $category = Category::getOneByMark($categoryMark);
       // $products = Product::getAllByCategoryName($categoryMark);
        $products = Product::getAllCTPR($categoryMark, $_POST);
        echo "<pre>";
        var_dump($products);
        var_dump(Flight::db()->last());
        echo "</pre>";
        $parameters = Parameter::getAllByCategory($category['id']);
        Flight::view()->assign('category', $category);
        Flight::view()->assign('parameters', $parameters);
        Flight::view()->assign('products', $products);
        Flight::view()->display('product/listing.tpl');
    }

    public static function show($product_mark)
    {
        $product = Product::getOneByMark($product_mark);
        $product_photos = ProductPhoto::getAllForProduct($product['id']);
        $product_params = ProductParam::getAllByProduct($product['id']);
        $categories = Category::getAll();
        Flight::view()->assign('categories', $categories);
        Flight::view()->assign('product', $product);
        Flight::view()->assign('product_photos', $product_photos);
        Flight::view()->assign('product_params', $product_params);
        Flight::view()->display('product/show.tpl');
    }
}
