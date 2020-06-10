{extends file="template.tpl"}

{block name="content"}
    <div class="title-block">
        <h3 class="title">
            Добавление категории
            <span data-type="bar" class="sparkline bar"></span>
        </h3>
    </div>

    <div class="card">
        <div class="card-block">
            <section class="col col-md-9">
                <form method="post">
                    {if !empty($success)}<span style="color: #4BCF99;">Категория успешно добавлена</span>{/if}
                    {if !empty($error)}<span style="color: #FF4444;">{$error}</span>{/if}
                    <div class="form-group">
                        <label class="control-label"> Метка (ENG): </label>
                        <input type="text" class="form-control boxed" name="Category[mark]">
                    </div>
                    <div class="form-group">
                        <label class="control-label"> Название: </label>
                        <input type="text" class="form-control boxed" name="Category[name]">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary right">Добавить</button>
                    </div>
                </form>
            </section>
        </div>
    </div>
{/block}