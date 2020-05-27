<?php

namespace App\Controllers;

use Flight;

use App\Models\{Category,Product};

class ProductController
{
    public static function create()
    {
        if (!empty($_POST['Product'])) {
            $data = $_POST['Product'];
            if (self::validate($data)) {
                Product::save($data);
                Flight::redirect('/admin/products/');
            } else {
                Flight::view()->assign('error', self::$error);
            }
        }
        $categories = Category::getAllByLang(1);
        Flight::view()->assign('categories', $categories);
        Flight::view()->display('product/create.tpl');
    }

    public static function show($product_mark)
    {
        Product::getOneByMark($product_mark);
        $categories = Category::getAllByLang(1);
        Flight::view()->assign('categories', $categories);
        Flight::view()->display('product/show.tpl');
    }
}
