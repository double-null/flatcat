{extends file="template.tpl"}

{block name="content"}

    <div class="title-block">
        <h3 class="title">
            Добавить характеристики обьекта
            <span data-type="bar" class="sparkline bar"></span>
        </h3>
    </div>

    <div class="card">
        <div class="card-block">
            <section>
                <form method="post">
                    {if !empty($error)}<span style="color: #FF4444;">{$error}</span>{/if}
                    {foreach $params as $param}
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> {$param.name} </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Params[{$param.param}]"></div>
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