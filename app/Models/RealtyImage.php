<?php

namespace App\Models;

use WideImage\WideImage as WideImage;
use App\Core\Image;

class RealtyImage extends Image
{
    public static $path = 'images/objects/original/';

    public static $second_path = 'images/objects/mini/';

    public static function resize($img_name)
    {
        $image = WideImage::loadFromFile(self::$path.$img_name);
        $image->resize(200)->saveToFile(self::$second_path.$img_name);
    }

    public static function removeThumbnail($img_name)
    {
        $fn = $_SERVER['DOCUMENT_ROOT'].'/'.static::$second_path.$img_name;
        if (file_exists($fn)) { unlink($fn); }
    }
}
