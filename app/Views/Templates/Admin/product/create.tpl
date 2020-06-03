{extends file="template.tpl"}

{block name="content"}

    <div class="title-block">
        <h3 class="title">
            Добавить обьект
            <span data-type="bar" class="sparkline bar"></span>
        </h3>
    </div>

    <div class="card">
        <div class="card-block">
            <section>
                <form method="post">
                    {if !empty($success)}<span style="color: #4BCF99;">Обьект добавлен успешно</span>{/if}
                    {if !empty($error)}<span style="color: #FF4444;">{$error}</span>{/if}
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Метка: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Product[mark]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Название: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Product[name]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Описание: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Product[short_desc]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Цена: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Product[price]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Категория: </label>
                        <div class="col-sm-10">
                            <select class="c-select form-control boxed" name="Product[category]">
                                <option></option>
                                {foreach $categories as $category}
                                    <option value="{$category.id}">{$category.name}</option>
                                {/foreach}
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