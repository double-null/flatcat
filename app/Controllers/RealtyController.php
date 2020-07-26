<?php

namespace App\Controllers;

use App\Models\Category;
use App\Models\Filter;
use App\Models\FilterVariants;
use App\Models\Realty;
use Flight;

class RealtyController
{
    public static function create($type)
    {
        Flight::view()->display('realty/create_'.$type.'.tpl');
    }

    public static function listing($id)
    {
        $lang = 1;
        $filters = Filter::getAll();
        $variants = FilterVariants::getAllByFilters([1,2,10,11]);
        $categoryName = Category::getOneByMark($id, $lang);
        switch ($id) {
            case 1: $types = [1,2]; break;
            case 2: $types = [8]; break;
            case 3: $types = [3, 4, 5, 6, 7]; break;
        }
        $flats = Realty::getAllByTypes($types);
        Flight::view()->assign('categoryID', $id);
        Flight::view()->assign('categoryName', $categoryName);
        Flight::view()->assign('totalProducts', 1);
        Flight::view()->assign('currentPage', 1);
        Flight::view()->assign('variants', $variants);
        Flight::view()->assign('filters', $filters);
        Flight::view()->assign('flats', $flats);
        Flight::view()->display('pages/flats.tpl');
    }

    public static function search()
    {
        $params = [];
        foreach ($_GET as $param => $value) {
            if (!empty($value)) {
                $params[$param] = trim($value);
            }
        }
        $objects = Realty::getAllByParams($params);
        Flight::view()->assign('objects', $objects);
        Flight::view()->display('realty/listing.tpl');
    }

    public static function show($objectID, $categoryID)
    {
        $object = Realty::getOneByID($objectID);
        Flight::view()->assign('object', $object);
        Flight::view()->assign('categoryID', $categoryID);
        Flight::view()->display('realty/show.tpl');
    }
}
