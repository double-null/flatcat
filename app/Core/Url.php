<?php

namespace App\Core;

class Url
{
    public static function generate($params)
    {
        $out = '?';
        foreach ($params as $param => $value) {
            if ($param == 'page') continue;
            if (is_array($value)) {
                foreach ($value as $sub_value) {
                    $out .= $param.'[]='.$sub_value.'&';
                }
            } else {
                $out .= $param.'='.$value.'&';
            }
        }
        return $out;
    }
}
