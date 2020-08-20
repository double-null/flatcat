<?php

namespace App\Controllers;

use App\Core\Url;
use App\Models\Category;
use App\Models\Realty;
use App\Models\Block;
use App\Models\RealtyImage;
use App\Models\User;
use Flight;

class RealtyController
{
    public static function create()
    {
        if (!empty($_POST['Realty'])) {
            Realty::$data = $_POST['Realty'];
            Realty::insert();
            Flight::redirect('/admin/objects/');
        }
        Flight::view()->display('realty/create.tpl');
    }

    public static function listing($id)
    {
        $categoryName = Category::getOneByMark($id, Flight::get('langID'));
        switch ($id) {
            case 1: $types = [1,2]; break;
            case 2: $types = [8]; break;
            case 3: $types = [3, 4, 5, 6, 7]; break;
            case 4: $types = [9]; break;
            case 5: $types = [1,2,3,4,5,6,7,8,9]; break;
        }
        $page = $_GET['page'] ?? 1;
        $limit = [($page - 1) * 10, 10];
        $input_filters = array_diff($_GET, []);
        if ($id == 5) { $input_filters['suburban'] = 1;}
        $totalObjects = Realty::countAllByTypes($types, $input_filters);
        $objects = Realty::getAllByTypes($types, $limit, $input_filters);
        Flight::view()->assign('categoryID', $id);
        Flight::view()->assign('categoryName', $categoryName);
        Flight::view()->assign('totalProducts', $totalObjects);
        Flight::view()->assign('currentPage', $page);
        Flight::view()->assign('currentUrl', Url::generate($input_filters));
        Flight::view()->assign('sVariants', Block::getOneByParams([
            'name' => 'variants',
            'lang' => Flight::get('langID'),
        ]));
        Flight::view()->assign('filters', Block::getOneByParams([
            'name' => 'filters',
            'lang' => Flight::get('langID'),
        ]));
        Flight::view()->assign('inscriptions', Block::getOneByParams([
            'name' => 'realty_list',
            'lang' => Flight::get('langID'),
        ]));
        Flight::view()->assign('objects', $objects);
        Flight::view()->display('realty/listing.tpl');
    }

    public static function suburbanListing()
    {
        $categoryName = Category::getOneByMark(5, Flight::get('langID'));
        Flight::view()->assign('categoryName', $categoryName);
        Flight::view()->assign('sVariants', Block::getOneByParams([
            'name' => 'variants',
            'lang' => Flight::get('langID'),
        ]));
        Flight::view()->assign('filters', Block::getOneByParams([
            'name' => 'filters',
            'lang' => Flight::get('langID'),
        ]));
        Flight::view()->assign('inscriptions', Block::getOneByParams([
            'name' => 'realty_list',
            'lang' => Flight::get('langID'),
        ]));
        Flight::view()->display('realty/suburban_list.tpl');
    }

    public static function privateListing()
    {
        $objects = Realty::getAll();
        Flight::view()->assign('objects', $objects);
        Flight::view()->display('realty/listing.tpl');
    }

    public static function modify()
    {
        $id = (int)$_GET['id'];
        if (!empty($_POST['Realty'])) {
            Realty::$data = $_POST['Realty'];
            Realty::updateByID($id);
        }
        $object = Realty::getOneByID($id);
        Flight::view()->assign('object', $object);
        Flight::view()->display('realty/modify.tpl');
    }

    public static function photos()
    {
        $object = (int)$_GET['id'];
        $images = Realty::getImagesForObject($object);
        if (!empty($_POST['drop'])) {
            $key = (int)$_POST['drop'] - 1;
            $drop_image = $images[$key];
            unset($images[$key]);
            Realty::updImagesForObject($object, $images);
            RealtyImage::drop($drop_image);
            RealtyImage::removeThumbnail($drop_image);
            Flight::json(['status' => 1]);
            die;
        }
        Flight::view()->assign('object', $object);
        Flight::view()->assign('images', $images);
        Flight::view()->display('realty/images.tpl');
    }

    public static function loadPhoto()
    {
        if (!empty($_FILES)) {
            $out = [];
            $object = (int)$_GET['object'];
            foreach ($_FILES as $photo) {
                RealtyImage::$data = $photo;
                if (RealtyImage::validate()) {
                    $new_img_name = RealtyImage::save();
                    RealtyImage::resize($new_img_name);
                    $out[] = $new_img_name;
                }
            }
            if (count($out) > 0) {
                $images = Realty::getImagesForObject($object);
                $object_images = array_merge($images, $out);
                Realty::updImagesForObject($object, $object_images);
            }
            Flight::redirect('/admin/object/images/?id='.$object);

        }
        Flight::view()->display('realty/load_photo.tpl');
    }

    public static function search()
    {
        $a = [
            'title' => 'Результаты поиска',
        ];

        $params = [];
        foreach ($_GET as $param => $value) {
            if (!empty($value)) {
                $params[$param] = trim($value);
            }
        }

        $inscriptions = Block::getOneByParams([
            'name' => 'realty_list',
            'lang' => Flight::get('langID'),
        ]);

        Flight::view()->assign('sVariants', Block::getOneByParams([
            'name' => 'variants',
            'lang' => Flight::get('langID'),
        ]));
        Flight::view()->assign('filters', Block::getOneByParams([
            'name' => 'filters',
            'lang' => Flight::get('langID'),
        ]));

        $types = (int)$_GET['type'];
        $page = $_GET['page'] ?? 1;
        $limit = [($page - 1) * 10, 10];
        $input_filters = array_diff($_GET, ['']);
        $totalObjects = Realty::countAllByTypes($types, $input_filters);
        $objects = Realty::getAllByTypes($types, $limit, $input_filters);

        Flight::view()->assign('categoryID', 1);
        Flight::view()->assign('currentUrl', Url::generate($input_filters));
        Flight::view()->assign('objects', $objects);
        Flight::view()->assign('totalProducts', $totalObjects);
        Flight::view()->assign('inscriptions', $inscriptions);
        Flight::view()->display('realty/listing.tpl');
    }

    public static function show($objectID, $categoryID)
    {
        $object = Realty::getOneByID($objectID);
        $agent = User::getOneWithDesc($object['agent']);
        $categoryName = Category::getOneByMark((int)$categoryID);
        Flight::view()->assign('object', $object);
        Flight::view()->assign('agent', $agent);
        Flight::view()->assign('categoryID', $categoryID);
        Flight::view()->assign('categoryName', $categoryName);
        Flight::view()->assign('inscriptions', Block::getOneByParams([
            'name' => 'show_object',
            'lang' => Flight::get('langID'),
        ]));
        Flight::view()->assign('parameters', Block::getOneByParams([
            'name' => 'realty_parameters',
            'lang' => Flight::get('langID'),
        ]));
        Flight::view()->display('realty/show.tpl');
    }
}
