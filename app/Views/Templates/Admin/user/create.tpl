{extends file="template.tpl"}

{block name="content"}

    <div class="title-block">
        <h3 class="title">
            Добавить агента
            <span data-type="bar" class="sparkline bar"></span>
        </h3>
    </div>

    <div class="card">
        <div class="card-block">
            <section>
                <form method="post" enctype="multipart/form-data">
                    {if !empty($success)}<span style="color: #4BCF99;">Агент добавлен успешно</span>{/if}
                    {if !empty($error)}<span style="color: #FF4444;">{$error}</span>{/if}
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Имя: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="User[name]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Телефон: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="User[phone]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> E-mail: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="User[email]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Пароль: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="User[password]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Фотография: </label>
                        <div class="col-sm-10"><input type="file" class="boxed" name="photo"></div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary right">Добавить</button>
                    </div>
                </form>
            </section>
        </div>
    </div>
{/block}