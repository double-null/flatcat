{extends file="template.tpl"}

{block name="content"}

    <div class="title-block">
        <h3 class="title">
            Добавление фотографий обьекта
            <span data-type="bar" class="sparkline bar"></span>
        </h3>
    </div>

    <div class="card">
        <div class="card-block">
            <section>
                <form method="post" enctype="multipart/form-data">
                    {if !empty($error)}<span style="color: #FF4444;">{$error}</span>{/if}
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Фотография </label>
                        <div class="col-sm-10"><input type="file" class="boxed" name="Photo1"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Фотография </label>
                        <div class="col-sm-10"><input type="file" class="boxed" name="Photo2"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Фотография </label>
                        <div class="col-sm-10"><input type="file" class="boxed" name="Photo3"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Фотография </label>
                        <div class="col-sm-10"><input type="file" class="boxed" name="Photo4"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Фотография </label>
                        <div class="col-sm-10"><input type="file" class="boxed" name="Photo5"></div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary right">Добавить</button>
                    </div>
                </form>
            </section>
        </div>
    </div>
{/block}