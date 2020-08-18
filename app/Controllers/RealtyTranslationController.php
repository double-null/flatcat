<?php

namespace App\Controllers;

use App\Models\RealtyTranslation;
use Flight;

class RealtyTranslationController
{
    public static function listing()
    {
        $object = (int)$_GET['id'];
        $translations = RealtyTranslation::getAllForObject($object);
        Flight::view()->assign('object', $object);
        Flight::view()->assign('translations', $translations);
        Flight::view()->display('realty_translation/listing.tpl');
    }

    public static function create()
    {
        $object = (int)$_GET['object'];
        if (!empty($_POST['Translation'])) {
            RealtyTranslation::$data = $_POST['Translation'];
            RealtyTranslation::$data['object'] = $object;
            if (RealtyTranslation::insert()) {
                Flight::redirect('/admin/object/translations/?id='.$object);
            }
        }
        Flight::view()->display('realty_translation/create.tpl');
    }

    public static function drop()
    {
        if (!empty($_POST['id'])) {
            RealtyTranslation::$data['id'] = (int)$_POST['id'];
            RealtyTranslation::delete();
            Flight::json(['status' => 1]);
        } else {
            Flight::json(['status' => 0]);
        }
    }
}