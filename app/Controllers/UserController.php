<?php

namespace App\Controllers;

use App\Models\User;
use App\Models\UserProfile;
use Flight;

class UserController
{
    public static function auth()
    {
        if (!empty($_POST['User'])) {
            $user = $_POST['User'];
            $userAuth = User::getAuth($user);
            if ($userAuth) {
                $_SESSION['user'] = $userAuth;
                Flight::redirect('/admin/category/create/');
            } else {
                Flight::view()->assign('auth_error', 1);
            }
        }
        Flight::view()->display('enter.tpl');
    }

    public static function create()
    {
        if (!empty($_POST['User'])) {
            User::$data = $_POST['User'];
            User::validate();
            if (!User::$error) {
                User::save();
                Flight::redirect('/admin/users/');
            } else {
                Flight::view()->assign('errors', User::$error);
            }
        }
        Flight::view()->display('user/create.tpl');
    }

    public static function listing()
    {
        Flight::view()->assign('users', User::getAll());
        Flight::view()->display('user/listing.tpl');
    }

    public static function openListing()
    {
        Flight::view()->assign('users', User::getAllWithProfile());
        Flight::view()->display('user/listing.tpl');
    }

    public static function drop()
    {
        User::$data['id'] = (int)$_POST['id'];
        User::delete();
        echo json_encode(['status' => 1]);
    }

    public static function search()
    {
        $chunkName = $_POST['chunk_name'];
        $users = UserProfile::searchByFullname($chunkName);
        echo json_encode($users);
    }
}
