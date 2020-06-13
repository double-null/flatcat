{extends file="template.tpl"}

{block name="content"}

    <div class="title-block">
        <h3 class="title">
            Изменить характеристики обьекта
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
                            <div class="col-sm-10">
                                {if $param.type == 3}
                                    <select class="form-control boxed" name="Params[{$param.id}]">
                                        {foreach $param.options as $key => $option}
                                            <option value="{$key+1}" {if $key+1 == $param.value}selected{/if}>
                                                {$option}
                                            </option>
                                        {/foreach}
                                    </select>
                                {elseif $param.type == 2}
                                    <div>
                                        <label>
                                            <input type="radio" name="Params[{$param.id}]" class="radio" value="1" {if $param.value == 1}checked{/if}>
                                            <span>Да</span>
                                        </label>
                                        <label>
                                            <input type="radio" name="Params[{$param.id}]" class="radio" value="0" {if $param.value == 0}checked{/if}>
                                            <span>Нет</span>
                                        </label>
                                    </div>
                                {else}
                                    <input type="text" class="form-control boxed" name="Params[{$param.id}]" value="{$param.value}">
                                {/if}
                            </div>
                        </div>
                    {/foreach}
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary right">Изменить</button>
                    </div>
                </form>
            </section>
        </div>
    </div>
{/block}