<?php

namespace App\Controllers;

use App\Models\User;
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
                Flight::view('auth_error', 1);
            }
        }
        Flight::view()->display('enter.tpl');
    }
}
