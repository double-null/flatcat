<?php

namespace App\Modules;

use Flight;

class ObjectParams
{
    public static function create()
    {
        /*
        if (!empty($_POST['Object'])) {

            Flight::db()->insert('products', $_POST['Object']);
            var_dump(Flight::db()->last());
            Flight::view()->assign('success', 1);
        }
        */

        $fields = Flight::db()->select('parameters',
            [
                '[>]parameters_desc(pd)' => ['id' => 'parameter'],
            ],
            ['parameters.mark', 'pd.name'],
            ['category' => 1]
        );
        Flight::view()->assign('parameters', $fields);
        Flight::view()->display('op/create.tpl');
    }
}
