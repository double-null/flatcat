<?php

namespace App\Controllers;

use App\Models\Flat;
use Flight;

class RealtyController
{
    public static function show($objectID, $categoryID)
    {
        switch ($categoryID) {
            case 1: $object = Flat::getOneByID($objectID);
        }
        /*
        echo "<pre>";
        var_dump($object);
        echo "</pre>";
         */
        Flight::view()->assign('object', $object);
        Flight::view()->assign('categoryID', $categoryID);
        Flight::view()->display('realty/show.tpl');
    }
}
