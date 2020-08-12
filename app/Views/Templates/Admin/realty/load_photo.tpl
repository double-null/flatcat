{extends file="template.tpl"}

{block name="html_title"} Админ панель &raquo; Загрузка фотографий обьекта{/block}

{block name="content"}
    <div class="title-block">
        <h3 class="title">
            Загрузить фотографии
            <span data-type="bar" class="sparkline bar"></span>
        </h3>
    </div>
    <div class="card">
        <div class="card-block">
            <section>
                <form method="post" enctype="multipart/form-data">
                    {if !empty($error)}<span style="color: #FF4444;">{$error}</span>{/if}
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Фото: </label>
                        <div class="col-sm-10"><input type="file" name="photo1" class="boxed"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Фото: </label>
                        <div class="col-sm-10"><input type="file" name="photo2" class="boxed"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Фото: </label>
                        <div class="col-sm-10"><input type="file" name="photo3" class="boxed"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Фото: </label>
                        <div class="col-sm-10"><input type="file" name="photo4" class="boxed"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Фото: </label>
                        <div class="col-sm-10"><input type="file" name="photo5" class="boxed"></div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary right">Добавить</button>
                    </div>
                </form>
            </section>
        </div>
    </div>
{/block}