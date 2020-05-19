<?php

namespace App\Modules;

use Flight;
use App\Models\Product;

class ProductModule
{
    private static $error;

    public static function create()
    {
        if (!empty($_POST['Product'])) {
            $data = $_POST['Product'];
            if (self::validate($data)) {
                Flight::db()->insert('products', $data);
                Flight::redirect('/admin/products/');
            } else {
                Flight::view()->assign('error', self::$error);
            }
        }
        $categories = Flight::db()->select('categories',
            [
                '[>]categories_desc' => ['id' => 'category'],
            ],
            ['categories.id', 'categories_desc.name'],
            [
                'categories_desc.lang' => 1,
            ]
        );
        Flight::view()->assign('categories', $categories);
        Flight::view()->display('product/create.tpl');
    }

    public static function listing()
    {
        $products = Product::getAllWithCategory();
        Flight::view()->assign('products', $products);
        Flight::view()->display('product/listing.tpl');
    }

    public static function validate($data)
    {
        if (empty($data['mark'])) {
            self::$error = 'Метка не заполнена';
        } elseif (strlen($data['mark']) > 40) {
            self::$error = 'Метка превышает 40 символов';
        } elseif (!(int)$data['category']) {
            self::$error = 'Категория не выбрана';
        } else {
            return true;
        }
        return false;
    }
}
