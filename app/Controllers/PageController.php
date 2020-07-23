<?php

namespace App\Controllers;

use App\Models\Block;
use App\Models\Review;
use Flight;

class PageController
{
    public static function main()
    {
        $reviews = Review::getAll();
        Flight::view()->assign('inscriptions', Block::getOneByParams(['name' => 'main_page']));
        Flight::view()->assign('advantages', Block::getOneByParams(['name' => 'advantages']));
        Flight::view()->assign('reviews', $reviews);
        Flight::view()->display('pages/main.tpl');
    }

    public static function start()
    {
        $a = [
            'leave_request' => 'შეიტანეთ განცხადება',
            'online_request' => 'განაცხადის on-line',
            'phone_title' => 'ტელეფონი',
            'submit_title' => 'პირადი',
            'confirm_data_processing' => 'მე ვაძლევ ჩემს თანხმობას დამუშავება მითითებული პირადი მონაცემები.',
            'copyrights' => 'iyidebabina.ge. ყველა უფლება დაცულია.',
        ];
        //echo json_encode($a);

        Flight::view()->assign('menu', Block::getOneByParams(['name' => 'menu']));
        Flight::view()->assign('common', Block::getOneByParams(['name' => 'all_pages']));
    }
}

