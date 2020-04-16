{extends file="template.tpl"}

{block name="content"}
    <div class="card">
        <div class="card-block">
            <div class="card-title-block">
                <h3 class="title">Добавить характеристики обьекта</h3>
            </div>
            <section id="add-category" class="col col-md-9">
                <form method="post">
                    {if !empty($success)}<span style="color: #4BCF99;">Обьект добавлен успешно</span>{/if}
                    {if !empty($error)}<span style="color: #FF4444;">{$error}</span>{/if}

                    {foreach $parameters as $parameter}
                    <div class="form-group">
                        <label class="control-label"> {$parameter.name} </label>
                        <input type="text" class="form-control boxed" name="Object[name]"
                               value="{if (!empty($data.route))}{$data.route}{/if}">
                    </div>
                    {/foreach}

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary right">Добавить</button>
                    </div>
                </form>
            </section>
        </div>
    </div>
{/block}