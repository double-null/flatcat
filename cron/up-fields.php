<?php
ini_set('max_execution_time', 600);
require_once './vendor/autoload.php';

\App\Controllers\APIController::updateFields();

$date = date('Y-m-d');
$log_file = '/home/iyidebab/domains/iyidebabina.ge/public_html/logs/cron_'.$date.'.txt';
$text = ' UP FIELDS';
file_put_contents($log_file, $text, FILE_APPEND);