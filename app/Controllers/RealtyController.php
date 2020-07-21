<?php

namespace App\Controllers;

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
        switch ($id) {
            case 1: $types = [1,2]; break;
            case 2: $types = [3, 4, 5, 6, 7]; break;
            case 3: $types = [8]; break;
        }
        $flats = Realty::getAllByTypes($types);
        Flight::view()->assign('categoryID', 1);
        Flight::view()->assign('totalProducts', 1);
        Flight::view()->assign('currentPage', 1);
        Flight::view()->assign('flats', $flats);
        Flight::view()->display('pages/flats.tpl');
    }

    public static function show($objectID, $categoryID)
    {
        $object = Realty::getOneByID($objectID);
        Flight::view()->assign('object', $object);
        Flight::view()->assign('categoryID', $categoryID);
        Flight::view()->display('realty/show.tpl');
    }
}
