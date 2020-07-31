<?php

namespace App\Controllers;

use App\Models\Advantage;
use App\Models\AdvantageImage;
use Flight;

class AdvantageController
{
    public static function listing()
    {
        Flight::view()->assign('advantages', Advantage::getAll());
        Flight::view()->display('advantage/listing.tpl');
    }

    public static function create()
    {
        if (!empty($_POST['Advantage'])) {
            Advantage::$data = $_POST['Advantage'];
            AdvantageImage::$data = $_FILES['photo'];
            Advantage::$data['photo_name'] = (AdvantageImage::validate()) ?
                AdvantageImage::save() : 0;
            Advantage::insert();
            Flight::redirect('/admin/advantages/');
        }
        Flight::view()->display('advantage/create.tpl');
    }
}
