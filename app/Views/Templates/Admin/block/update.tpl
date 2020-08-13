{extends file="template.tpl"}

{block name="content"}

<div class="title-block">
    <h3 class="title">
        Редактирование блока
        <span data-type="bar" class="sparkline bar"></span>
    </h3>
</div>

<div class="card">
    <div class="card-block">
        <section>
            <form method="post">
                {if !empty($error)}<span style="color: #FF4444;">{$error}</span>{/if}
                {foreach $block.code as $first_key => $first_value}
                    {if is_array($first_value)}
                        {foreach $first_value as $second_key => $second_value}
                            <div class="form-group row">
                                <label class="col-sm-2 form-control-label text-xs-right"> {$second_key} </label>
                                <div class="col-sm-10">
                                    {if $second_value|count_characters < 120}
                                        <input type="text" class="form-control boxed" name="Code[{$first_key}][{$second_key}]" value="{$second_value|escape:'html'}">
                                    {else}
                                        <textarea class="form-control boxed" rows="10" cols="30" name="Code[{$first_key}][{$second_key}]">{$second_value|escape:'html'}</textarea>
                                    {/if}
                                </div>
                            </div>
                        {/foreach}
                    {else}
                        <div class="form-group row">
                            <label class="col-sm-2 form-control-label text-xs-right"> {$first_key} </label>
                            <div class="col-sm-10">
                                {if $first_value|count_characters < 120}
                                    <input type="text" class="form-control boxed" name="Code[{$first_key}]" value="{$first_value|escape:'html'}">
                                {else}
                                    <textarea class="form-control boxed" rows="10" cols="30" name="Code[{$first_key}]">{$first_value|escape:'html'}</textarea>
                                {/if}
                            </div>
                        </div>
                    {/if}
                {/foreach}

                <div class="form-group">
                    <button type="submit" class="btn btn-primary right">Изменить</button>
                </div>
            </form>
        </section>
    </div>
</div>

{/block}