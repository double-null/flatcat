{extends file="template.tpl"}

{block name="html_title"} Админ панель &raquo; Добавление описания отзыва{/block}

{block name="content"}
    <div class="title-block">
        <h3 class="title">
            Добавить описание для отзыва
            <span data-type="bar" class="sparkline bar"></span>
        </h3>
    </div>
    <div class="card">
        <div class="card-block">
            <section>
                <form method="post" enctype="multipart/form-data">
                    {if !empty($error)}<span style="color: #FF4444;">{$error}</span>{/if}
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Имя: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Review[name]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Контент: </label>
                        <div class="col-sm-10">
                            <textarea class="form-control boxed" name="Review[content]" cols="30" rows="10"></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Язык: </label>
                        <div class="col-sm-10">
                            <select class="c-select form-control boxed" name="Review[lang]">
                                <option value="1">Грузинский</option>
                                <option value="2">Английский</option>
                                <option value="3">Русский</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary right">Добавить</button>
                    </div>
                </form>
            </section>
        </div>
    </div>
{/block}