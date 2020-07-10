<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title> ModularAdmin - Enter </title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">

    <link rel="stylesheet" id="theme-style" href="/themes/Admin/css/app-green.css">
    <link rel="stylesheet" id="theme-style" href="/themes/Admin/css/app.css">
    <link rel="stylesheet" id="theme-style" href="/themes/Admin/css/vendor.css">
</head>
<body>
<div class="auth">
    <div class="auth-container">
        <div class="card">
            <header class="auth-header">
                <h1 class="auth-title">
                    <div class="logo">
                        <span class="l l1"></span>
                        <span class="l l2"></span>
                        <span class="l l3"></span>
                        <span class="l l4"></span>
                        <span class="l l5"></span>
                    </div> ModularAdmin
                </h1>
            </header>
            <div class="auth-content">
                <p class="text-center">LOGIN TO CONTINUE</p>
                <form id="login-form" method="POST">
                    <div class="form-group">
                        <label for="username">E-mail</label>
                        <input type="text" class="form-control underlined" name="User[email]" id="username" placeholder="Your email address">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control underlined" name="User[password]" id="password" placeholder="Your password">
                    </div>
                    <div class="form-group">
                        <label for="remember">
                            <input class="checkbox" id="remember" type="checkbox" name="User[remember]">
                            <span>Remember me</span>
                        </label>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-block btn-primary">Login</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="/themes/Admin/js/vendor.js"></script>
</body>
</html>