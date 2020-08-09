<?php

namespace App\Controllers;

use App\Models\Category;
use App\Models\Review;
use App\Models\User;
use App\Models\UserProfile;
use App\Models\UserAvatar;
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

    public static function settings()
    {
        if (!empty($_POST['User'])) {
            User::$data = $_POST['User'];
            $success = User::updateAuthParams();
            if ($success) {
                Flight::view()->assign('success', 1);
            }
        }
        Flight::view()->display('user/settings.tpl');
    }

    public static function create()
    {
        if (!empty($_POST['User'])) {

            User::$data = array_merge($_POST['User'], [
                'password' => md5($_POST['User']['password']),
                'role' => '2',
                'created' => time(),
            ]);
            if (!empty($_FILES['photo'])) {
                UserAvatar::$data = $_FILES['photo'];
                if (UserAvatar::validate()) {
                    $photoName = '/'.UserAvatar::$path.UserAvatar::save();
                    UserProfile::$data['photo'] = $photoName;
                }
            }
            if (User::validate()) {
                User::insert();
                Flight::redirect('/admin/users/');
            }  else {
                Flight::view()->assign('error', User::$error);
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
        Flight::view()->assign('categoryName', Category::getOneByMark(6));
        Flight::view()->assign('users', User::getAllWithDesc());
        Flight::view()->display('user/listing.tpl');
    }

    public static function show($id)
    {
        Flight::view()->assign('user', User::getOneWithProfile($id));
        Flight::view()->assign('reviews', Review::getAllForUser($id));
        Flight::view()->display('user/show.tpl');
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
