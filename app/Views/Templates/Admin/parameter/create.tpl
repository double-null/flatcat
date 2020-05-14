{extends file="template.tpl"}

{block name="content"}
    <div class="title-block">
        <h3 class="title">
            Добавление параметра обьекта
            <span data-type="bar" class="sparkline bar"></span>
        </h3>
    </div>

    <div class="card">
        <div class="card-block">
            <section class="col col-md-9">
                <form method="post">
                    {if !empty($success)}<span style="color: #4BCF99;">Описание добавлено</span>{/if}
                    {if !empty($error)}<span style="color: #FF4444;">{$error}</span>{/if}
                    <div class="form-group">
                        <label class="control-label">Категория:</label>
                        <select class="form-control boxed" name="Parameter[category]">
                            <option></option>
                            {foreach $categories as $category}
                            <option value="{$category.id}">{$category.mark}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Метка:</label>
                        <input type="text" class="form-control boxed" name="Parameter[mark]">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary right">Добавить</button>
                    </div>
                </form>
            </section>
        </div>
    </div>
{/block}