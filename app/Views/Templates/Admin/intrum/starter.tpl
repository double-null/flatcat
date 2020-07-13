{extends file="template.tpl"}

{block name="html_title"}Админ панель &raquo; Intrum{/block}

{block name="content"}
    <div class="title-block">
        <h3 class="title">
            Обновление базы из Intrum
            <span data-type="bar" class="sparkline bar"></span>
        </h3>
    </div>

    <div class="card">
        <div class="card-block">
            <section>
                <form method="post">
                    {if !empty($success)}<span style="color: #4BCF99;">Описание добавлено</span>{/if}
                    {if !empty($error)}<span style="color: #FF4444;">{$error}</span>{/if}

                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Категория: </label>
                        <div class="col-sm-8">
                            <select class="c-select form-control boxed" name="Intrum[category]">
                                {foreach $categories as $category}
                                    <option value="{$category.id}">{$category.name}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-sm-2">
                            <button type="submit" class="btn btn-primary right">Обновить список обьектов</button>
                        </div>
                    </div>


                </form>
                <form method="post">
                    <div class="form-group">
                        <input type="hidden" value="1" name="Intrum[fields]">
                        <button type="submit" class="btn btn-primary right">Обновить список полей</button>
                    </div>
                </form>
                <form method="post">
                    <div class="form-group">
                        <input type="hidden" value="1" name="Intrum[agents]">
                        <button type="submit" class="btn btn-primary right">Обновить список агентов</button>
                    </div>
                </form>
                <form method="post">
                    <div class="form-group">
                        <input type="hidden" value="1" name="Intrum[categories]">
                        <button type="submit" class="btn btn-primary right">Обновить список категорий</button>
                    </div>
                </form>
            </section>
        </div>
    </div>
{/block}