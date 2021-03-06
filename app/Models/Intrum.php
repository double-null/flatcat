<?php

namespace App\Models;

class Intrum
{
    public static $key = '9a4c467ad980332a9a2d71ce88dd307b';

    public static $url;

    public static $params;

    public static $response;

    public static function getFields()
    {
        self::$url = 'http://iyidebabina.intrumnet.com:81/sharedapi/stock/fields';
        self::run();
        return self::$response->data;
    }

    public static function getCategories()
    {
        self::$url = 'http://iyidebabina.intrumnet.com:81/sharedapi/stock/types';
        self::run();
        return self::$response->data;
    }

    public static function getAgents()
    {
        self::$url = 'http://iyidebabina.intrumnet.com:81/sharedapi/worker/filter';
        self::run();
        return self::$response->data;
    }

    public static function getProducts($category)
    {
        self::$url = 'http://iyidebabina.intrumnet.com:81/sharedapi/stock/filter';

        self::$params = ['type' => $category];

        self::run();

        return self::$response->data->list;
        /*
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
        */
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
