<!DOCTYPE html>

<html>
    <head>
        <title>{block name="html_title"}{/block}</title>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <link rel="stylesheet" href="/themes/Flatcat/css/bootstrap-grid.min.css">
        <link rel="stylesheet" href="/themes/Flatcat/css/fotorama.css">
        <link rel="stylesheet" href="/themes/Flatcat/css/style.css">
        <script src="/themes/Flatcat/js/jquery-3.4.1.min.js"></script>
        <script src="/themes/Flatcat/js/fotorama.js"></script>
        <script src="/themes/Flatcat/js/custom.js"></script>
    </head>
<body>

<header class="main-header">
    <div class="container">
        <div class="row header-general">
            <div class="col-md-4">
                <a class="header-sub-block" href="/">
                    <img alt="" src="/themes/Flatcat/images/logo-site.svg">
                </a>
            </div>
            <div class="col-md-2">(4922) 44 44 11</div>
            <div class="col-md-2">
                пн-вс 9:00-20:00 <br>
                call-центр
            </div>
            <div class="col-md-4 ticket-action">
                <a class="green-btn popup-open" data-id="1">Оставить заявку</a>
            </div>
        </div>
        <div class="row header-menu">
            <div class="col-md-12">
                <ul>
                    {foreach $categories as $category}
                        <li><a href="/category/{$category.mark}/">{$category.name}</a></li>
                    {/foreach}
                    <li><a href="/agents/">Агенты</a></li>
                    <li><a href="/reviews/">Отзывы</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>

<div class="container" id="breadcrumbs">
    <div class="row">
        <div class="col-12">
            <ul class="breadcrumbs">
                {block name="breadcrumbs"}{/block}
            </ul>
        </div>
    </div>
</div>

<div id="content"> {block name="content"}{/block}</div>

<footer class="container-fluid">
    <div id="city"></div>
    <div id="rights" class="row">
        <div class="col-md-12">© 2006—2020 Компания "Имя" Все права защищены.</div>
    </div>
</footer>

<div class="popup-fade" data-id="1">
    <div class="popup">
        <a class="popup-close" href="#">×</a>
        <span class="popup-title">Заявка on-line</span>
        <form method="post">
            <div class="row">
                <label class="col-md-6"> Телефон <b style="color: red">*</b> </label>
                <input class="col-md-6" type="text" name="Request[phone]">
            </div>
            <div class="row">
                <input type="checkbox" name="Request[accept]" value="on">
                <span class="small">Даю согласие на обработку указанных персональных данных.</span>
            </div>
            <div class="row">
                <input class="green-btn" type="submit" value="Отправить">
            </div>
        </form>
    </div>
</div>

</body>
</html>