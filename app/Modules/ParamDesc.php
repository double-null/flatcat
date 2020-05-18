<?php

namespace App\Modules;

use Flight;

class ParamDesc
{
    public static $id;

    private static $error;

    public static function create()
    {
        if (!empty($_POST['Param'])) {
            $data = $_POST['Param'];
            if (self::validate($data)) {
                $data['parameter'] = self::$id;
                Flight::db()->insert('parameters_desc', $data);
                Flight::redirect('/admin/param_desc/listing/'.self::$id.'/');
            } else {
                Flight::view()->assign('error', self::$error);
            }
        }
        $param = Flight::db()->get('parameters', ['mark'], ['id' => self::$id]);
        Flight::view()->assign('param_mark', $param['mark']);
        Flight::view()->display('param_desc/create.tpl');
    }

    public static function listing()
    {
        $parameter = Flight::db()->get('parameters',
            ['id', 'mark'],
            ['id' => self::$id]
        );
        $pd = Flight::db()->select('parameters_desc',
            [
                '[>]parameters' => ['parameter' => 'id'],
                '[>]categories' => ['parameters.id' => 'id'],
            ],
            [
                'parameters_desc.id', 'parameters_desc.lang',
                'parameters_desc.name', 'parameters_desc.unit',
                'parameters.mark(param)', 'categories.mark(category)',
            ],
            [
                'parameters.id' => self::$id,
            ]
        );
        Flight::view()->assign('parameter', $parameter);
        Flight::view()->assign('descriptions', $pd);
        Flight::view()->display('param_desc/listing.tpl');
    }

    public static function validate($data)
    {
        if (empty($data['name'])) {
            self::$error = 'Название не заполнено';
        } elseif (strlen($data['name']) > 40) {
            self::$error = 'Название превышает 40 символов';
        } elseif (!(int)$data['lang']) {
            self::$error = 'Язык не выбран!';
        } else {
            return true;
        }
        return false;
    }
}
