<?php

namespace App\Models;

class Intrum
{
    public static $key = '';

    public static $url;

    public static $params;

    public static $response;

    public static function getFields()
    {
        self::$url = 'http://iyidebabina.intrumnet.com:81/sharedapi/stock/fields';
        self::run();
        return self::$response->data;
    }

    public static function getProduct()
    {
        self::$url = 'http://iyidebabina.intrumnet.com:81/sharedapi/stock/filter';

        self::$params = ['type'=>1];

        self::run();

        if (self::$response->status == 'success') {
            foreach (self::$response->data->list as $product) {
                $out[] = [
                    'mark' => $product->id,
                    'user' => $product->author,
                    'name' => $product->name,
                    'short_desc' => $product->fields[0]->value . ', ' .
                                    $product->fields[1]->value . ', ' .
                                    $product->fields[2]->value,
                    'price' => 0,
                    'category' => 1,
                    'created' => strtotime($product->date_add),
                ];
            }
            return $out;
        }
        else return false;
    }

    public static function run()
    {
        $post = ['apikey' => self::$key, 'params' => self::$params];
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, self::$url);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($post));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        self::$response = json_decode(curl_exec($ch));
        curl_close ($ch);
    }
}
