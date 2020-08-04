<?php

namespace App\Controllers;

use App\Models\Block;
use Flight;

class FeedbackController
{
    public static function send()
    {
        $messages = Block::getOneByParams(['name' => 'feedback_messages']);
        if (!empty($_POST['phone'])) {
            $result = $messages['success'];
        } else {
            $result = $messages['phone_error'];
        }
        Flight::json($result);
    }
}
