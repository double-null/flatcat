{extends file="template.tpl"}

{block name="html_title"} Админ панель &raquo; Настройки пользователя{/block}

{block name="content"}

    <div class="title-block">
        <h3 class="title">
            Настройки пользователя
            <span data-type="bar" class="sparkline bar"></span>
        </h3>
    </div>

    <div class="card">
        <div class="card-block">
            <section>
                <form method="post">
                    {if !empty($success)}<span style="color: #4BCF99;">Информация изменена</span>{/if}
                    {if !empty($error)}<span style="color: #FF4444;">{$error}</span>{/if}
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Новый E-mail: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="User[email]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Новый Пароль: </label>
                        <div class="col-sm-10"><input type="password" class="form-control boxed" name="User[new_password]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Повторите новый пароль: </label>
                        <div class="col-sm-10"><input type="password" class="form-control boxed" name="User[new_repass]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Текущий пароль: </label>
                        <div class="col-sm-10"><input type="password" class="form-control boxed" name="User[password]"></div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary right">Изменить</button>
                    </div>
                </form>
            </section>
        </div>
    </div>
{/block}