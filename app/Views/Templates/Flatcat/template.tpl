<!DOCTYPE html>

<html>
    <head>
        <title>{block name="html_title"}{/block}</title>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <link rel="stylesheet" href="/themes/Flatcat/css/bootstrap-grid.min.css">
        <link rel="stylesheet" href="/themes/Flatcat/css/owl.carousel.min.css">
        <link rel="stylesheet" href="/themes/Flatcat/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="/themes/Flatcat/css/fotorama.css">
        <link rel="stylesheet" href="/themes/Flatcat/css/sumoselect.min.css">
        <link rel="stylesheet" href="/themes/Flatcat/css/style.css">
        <script src="/themes/Flatcat/js/jquery-3.4.1.min.js"></script>
        <script src="/themes/Flatcat/js/owl.carousel.min.js"></script>
        <script src="/themes/Flatcat/js/fotorama.js"></script>
        <script src="/themes/Flatcat/js/jquery.sumoselect.min.js"></script>
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
                <a class="green-btn popup-open" data-id="1">{$common.leave_request}</a>
            </div>
        </div>
        <div class="row header-menu">
            <div class="col-md-12">
                <ul>
                    {foreach $menu as $item}
                        <li><a href="{$item.link}">{$item.name}</a></li>
                    {/foreach}
                </ul>
                <div id="filters" class="col-md-12">{block name="filters"}{/block}</div>
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
        <div class="col-md-12"> © {$smarty.now|date_format:'Y'} {$common.copyrights}</div>
    </div>
</footer>

<div class="popup-fade" data-id="1">
    <div class="popup">
        <a class="popup-close" href="#">×</a>
        <span class="popup-title">{$common.online_request}</span>
        <form method="post">
            <div class="row">
                <label class="col-md-6"> {$common.phone_title} <b style="color: red">*</b> </label>
                <input class="col-md-6" type="text" name="Request[phone]">
            </div>
            <div class="row">
                <input type="checkbox" name="Request[accept]" value="on">
                <span class="small">{$common.confirm_data_processing}</span>
            </div>
            <div class="row">
                <input class="green-btn" type="submit" value="{$common.submit_title}">
            </div>
        </form>
    </div>
</div>

</body>
</html>