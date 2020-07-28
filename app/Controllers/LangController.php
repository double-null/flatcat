<?php

namespace App\Controllers;

use App\Models\Lang;
use Flight;

class LangController
{
    public static function change()
    {
        $lang = (int)$_GET['lang'];
        $_SESSION['lang']['id'] = $lang;
        $_SESSION['lang']['short_name'] = Lang::getOneByID($lang);
        Flight::redirect(Flight::request()->referrer);
    }

    public static function setDefault()
    {
        if (empty($_SESSION['lang'])) {
            $_SESSION['lang']['id'] = 1;
            $_SESSION['lang']['short_name'] = Lang::getOneByID(1);
        }
    }
}
