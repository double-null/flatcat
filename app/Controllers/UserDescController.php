<?php

namespace App\Controllers;

use App\Models\UserDesc;
use Flight;

class UserDescController
{
    public static function listing()
    {
        $user = (int)$_GET['user'];
        Flight::view()->assign('descriptions', UserDesc::getAllByUser($user));
        Flight::view()->assign('user', ['id' => $user]);
        Flight::view()->display('user_desc/listing.tpl');
    }

    public static function create()
    {
        if (!empty($_POST['Desc'])) {
            $agentID = (int)$_GET['user'];
            UserDesc::$data = $_POST['Desc'];
            UserDesc::$data['user'] = $agentID;
            if (UserDesc::insert()) {
                Flight::redirect('/admin/user_descs/?user=' . $agentID);
            }
        }
        Flight::view()->display('user_desc/create.tpl');
    }

    public static function drop()
    {
        if (!empty($_POST['id'])) {
            UserDesc::$data['id'] = (int)$_POST['id'];
            UserDesc::delete();
            Flight::json(['status' => 1]);
        } else {
            Flight::json(['status' => 0]);
        }
    }
}