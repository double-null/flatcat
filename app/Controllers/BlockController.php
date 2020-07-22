<?php

namespace App\Controllers;

use App\Models\Block;
use Flight;

class BlockController
{
    public static function listing()
    {
        Flight::view()->assign('blocks', Block::getAll());
        Flight::view()->display('block/listing.tpl');
    }

    public static function update($id)
    {
        if (!empty($_POST['Code'])) {
            Block::$data = ['code' => json_encode($_POST['Code'])];
            Block::updateByID($id);
        }
        Flight::view()->assign('block', Block::getOneByID($id));
        Flight::view()->display('block/update.tpl');
    }
}
