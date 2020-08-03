<?php

namespace App\Controllers;

use App\Core\Url;
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
        $variants = FilterVariants::getAllByFilters([1,2,5,10,11]);
        $categoryName = Category::getOneByMark($id, $lang);
        $limitations = [];
        if (!empty($_GET['rooms'])) {
            $limitations['rooms'] = $_GET['rooms'];
        }
        switch ($id) {
            case 1: $types = [1,2]; break;
            case 2: $types = [8]; break;
            case 3: $types = [3, 4, 5, 6, 7]; break;
        }
        $page = ((int)$_GET['page'] != 0) ? (int)$_GET['page'] : 1;
        $limit = [($page - 1) * 10, 10];
        $input_filters = array_diff($_GET, ['']);
        $totalObjects = Realty::countAllByTypes($types, $input_filters);
        $objects = Realty::getAllByTypes($types, $limit, $input_filters);
        Flight::view()->assign('categoryID', $id);
        Flight::view()->assign('categoryName', $categoryName);
        Flight::view()->assign('totalProducts', $totalObjects);
        Flight::view()->assign('currentPage', $page);
        Flight::view()->assign('variants', $variants);
        Flight::view()->assign('filters', $filters);
        Flight::view()->assign('currentUrl', Url::generate($input_filters));
        Flight::view()->assign('objects', $objects);
        Flight::view()->display('realty/listing.tpl');
    }

    public static function privateListing()
    {
        $objects = Realty::getAll();
        Flight::view()->assign('objects', $objects);
        Flight::view()->display('realty/listing.tpl');
    }

    public static function modify()
    {
        $id = (int)$_GET['id'];
        if (!empty($_POST['Realty'])) {
            Realty::$data = $_POST['Realty'];
            Realty::updateByID($id);
        }
        $object = Realty::getOneByID($id);
        Flight::view()->assign('object', $object);
        Flight::view()->display('realty/modify.tpl');
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
