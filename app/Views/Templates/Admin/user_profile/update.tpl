{extends file="template.tpl"}

{block name="content"}
    <div class="title-block">
        <h3 class="title">
            Редактирование профиля
            <span data-type="bar" class="sparkline bar"></span>
        </h3>
    </div>

    <div class="card">
        <div class="card-block">
            <section>
                <form method="post" enctype="multipart/form-data">
                    {if !empty($success)}<span style="color: #4BCF99;">Профиль отредактирован</span>{/if}
                    {if !empty($error)}<span style="color: #FF4444;">{$error}</span>{/if}
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> ФИО: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" name="Profile[fullname]" value="{$profile.fullname}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Должность: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" name="Profile[position]" value="{$profile.position}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Телефон: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" name="Profile[phone]" value="{$profile.phone}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> О себе: </label>
                        <div class="col-sm-10">
                            <textarea class="form-control boxed" name="Profile[about]" cols="30" rows="10">{$profile.about}</textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Фотография: </label>
                        <div class="col-sm-10"><input type="file" name="photo" class="boxed"></div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary right"> Редактировать </button>
                    </div>
                </form>
            </section>
        </div>
    </div>
{/block}