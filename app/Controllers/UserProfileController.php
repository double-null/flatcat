<?php

namespace App\Controllers;

use App\Models\{UserProfile, UserAvatar};
use Flight;

class UserProfileController
{
    public static function update()
    {
        $user = Flight::get('user_id');
        if (!empty($_POST['Profile'])) {
            UserProfile::$data = array_merge($_POST['Profile'], ['user' => $user]);
            if (!empty($_FILES['photo'])) {
                UserAvatar::$data = $_FILES['photo'];
                if (UserAvatar::validate()) {
                    $photoName = '/'.UserAvatar::$path.UserAvatar::save();
                    UserProfile::$data['photo'] = $photoName;
                }
            }
            UserProfile::save();
        }
        $profile = UserProfile::getOneByUser($user);
        Flight::view()->assign('profile', $profile);
        Flight::view()->display('user_profile/update.tpl');
    }
}