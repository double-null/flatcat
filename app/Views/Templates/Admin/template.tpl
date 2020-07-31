<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>{block name="html_title"}{/block}</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="https://modularcode.io/modular-admin-html/apple-touch-icon.png">
    <link rel="stylesheet" href="/themes/Admin/css/additionally.css">
    <link rel="stylesheet" href="/themes/Admin/css/app-green.css">
    <link rel="stylesheet" href="/themes/Admin/css/app.css">
    <link rel="stylesheet"  href="/themes/Admin/css/vendor.css">
    <style type="text/css">.jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;box-sizing: content-box;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}</style>
</head>
<body class="loaded">
<div class="main-wrapper">
    <div class="app" id="app">
        <header class="header">
            <div class="header-block header-block-nav">
                <ul class="nav-profile">
                    <li class="profile dropdown">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="https://modularcode.io/modular-admin-html/forms.html#" role="button" aria-haspopup="true" aria-expanded="false">
                            <span class="name"> {$user_info['name']} </span>
                        </a>
                        <div class="dropdown-menu profile-dropdown-menu" aria-labelledby="dropdownMenu1">
                            <a class="dropdown-item" href="/admin/user_profile/">
                                <i class="fa fa-user icon"></i> Профиль
                            </a>
                            <a class="dropdown-item" href="/admin/user_settings/">
                                <i class="fa fa-gear icon"></i> Настройки
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/admin/logout/">
                                <i class="fa fa-power-off icon"></i> Выход
                            </a>
                        </div>
                    </li>
                </ul>
            </div>
        </header>
        <aside class="sidebar">
            <div class="sidebar-container">
                <div class="sidebar-header">
                    <div class="brand">
                        <div class="logo">
                            <span class="l l1"></span>
                            <span class="l l2"></span>
                            <span class="l l3"></span>
                            <span class="l l4"></span>
                            <span class="l l5"></span>
                        </div>
                    </div>
                </div>
                <nav class="menu">
                    <ul class="sidebar-menu metismenu" id="sidebar-menu">
                        <li>
                            <a href="/"><i class="fa fa-home"></i> Главная </a>
                        </li>
                        {if $user_info['role'] == 1}
                            <li>
                                <a href="/admin/blocks/">
                                    <i class="fa fa-newspaper-o"></i> Текстовые блоки
                                </a>
                            </li>
                        {/if}
                        {if $user_info['role'] == 1}
                            <li>
                                <a href="#">
                                    <i class="fa fa-user"></i> Агенты <i class="fa arrow"></i>
                                </a>
                                <ul class="sidebar-nav collapse">
                                    <li><a href="/admin/users/"> Список агентов </a></li>
                                    <li><a href="/admin/user/create/"> Добавить агента </a></li>
                                </ul>
                            </li>
                        {/if}
                        {if $user_info['role'] == 1}
                            <li>
                                <a href="#">
                                    <i class="fa fa-th-large"></i> Категории <i class="fa arrow"></i>
                                </a>
                                <ul class="sidebar-nav collapse">
                                    <li><a href="/admin/categories/"> Список категорий </a></li>
                                    <li><a href="/admin/category/create/"> Добавить категорию </a></li>
                                </ul>
                            </li>
                        {/if}
                        {if $user_info['role'] == 1 || $user_info['role'] == 2}
                            <li>
                                <a href="/admin/slider/"><i class="fa fa-file"></i> Обьекты <i class="fa arrow"></i></a>
                                <ul class="sidebar-nav collapse">
                                    <li><a href="/admin/product/create/"> Добавить обьект </a></li>
                                    <li><a href="/admin/realty/create/1/"> Добавить квартиру </a></li>
                                    <li><a href="/admin/realty/create/2/"> Добавить комнату </a></li>
                                    <li><a href="/admin/realty/create/3/"> Добавить дом </a></li>
                                    <li><a href="/admin/product/create/"> Добавить дачу </a></li>
                                    <li><a href="/admin/product/create/"> Добавить участок </a></li>
                                    <li><a href="/admin/objects/"> Список обьектов </a></li>
                                </ul>
                            </li>
                        {/if}
                        {if $user_info['role'] == 1 || $user_info['role'] == 2}
                            <li><a href="/admin/reviews/"><i class="fa fa-comments-o"></i> Отзывы </a></li>
                        {/if}
                        {if $user_info['role'] == 1}
                            <li>
                                <a href="/admin/advantages/"><i class="fa fa-thumbs-o-up"></i> Преимущества </i></a>
                            </li>
                        {/if}
                        {if $user_info['role'] == 1}
                            <li>
                                <a href="/admin/intrum/actions/">
                                    <i class="fa fa-arrows-h"></i> Intrum </i>
                                </a>
                            </li>
                        {/if}
                    </ul>
                </nav>
            </div>
            <footer class="sidebar-footer"></footer>
        </aside>
        <div class="sidebar-overlay" id="sidebar-overlay"></div>
        <div class="sidebar-mobile-menu-handle" id="sidebar-mobile-menu-handle"></div>
        <div class="mobile-menu-handle"></div>

        <article class="content forms-page">{block name="content"}{/block}</article>

        <footer class="footer"></footer>

        {block name="modal"}{/block}
    </div>
</div>
<script src="/themes/Admin/js/vendor.js"></script>
<script src="/themes/Admin/js/app.js"></script>
<script src="/themes/Admin/js/custom.js"></script>
{block name="scripts"}{/block}
<input type="file" multiple="multiple" class="dz-hidden-input" style="visibility: hidden; position: absolute; top: 0px; left: 0px; height: 0px; width: 0px;"><!----><div class="responsive-bootstrap-toolkit"><div class="device-xs hidden-sm-up"></div><div class="device-sm hidden-xs-down hidden-md-up"></div><div class="device-md hidden-sm-down hidden-lg-up"></div><div class="device-lg hidden-md-down hidden-xl-up"></div><div class="device-xl hidden-lg-down"></div></div>
</body>
</html>