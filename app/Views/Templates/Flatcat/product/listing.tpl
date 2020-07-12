{extends file="template.tpl"}

{block name="html_title"}{$category.name}{/block}

{block name="filters"}
    <div id="filters-block" class="row">
        <form method="post" class="filters-list row">
            {foreach $parameters as $parameter}
                {if $parameter.filter == 1}
                    {if $parameter.type|in_array:[3,4]}
                        <div class="filters-item">
                            {if $parameter.options|json_decode|is_array}
                                <select multiple="multiple" placeholder="{$parameter.name}"
                                        class="SlectBox" name="{$parameter.mark}[]" onclick="console.log($(this).val())">
                                    {foreach $parameter.options|json_decode as $variant}
                                        <option value="{$variant@iteration}">{$variant}</option>
                                    {/foreach}
                                </select>
                            {/if}
                        </div>
                    {/if}
                    {if $parameter.type == 2}
                       <div class="filters-item">
                            <input id="check{$parameter.mark}" type="checkbox" name="{$parameter.mark}[]" value="1">
                            <label for="check{$parameter.mark}">{$parameter.name}</label>
                        </div>
                    {/if}
                {/if}
            {/foreach}
            <div class="filter-submit"><button id="filter-send" type="submit" class="green-btn">Найти</button></div>
        </form>
    </div>
{/block}

{block name="breadcrumbs"}
    <li><a href="/">Главная</a></li>
    <li>{$category.name}</li>
{/block}

{block name="content"}
    <div class="container">
        <div class="row">
        {foreach $products as $product}
            <div class="col-md-4 object-item">
                <div style="width: 100%; position: relative;">
                    <a class="object-link" href="/product/{$product.mark}/">
                        {if !empty($product.photos)}
                            <div class="object-photos">
                                <img class="img-fluid" src="/images/objects/mini/{$product.photos[0]}">
                            </div>
                            <span class="obj-hover-img">
                                {foreach $product['photos'] as $photo}
                                    {if $photo@iteration <= 5}<span class="obj-hover-img-5" data-photo="{$photo}"></span>{/if}
                                {/foreach}
                            </span>
                        {else}
                            <div class="object-photos">
                                <img class="img-fluid" src="/images/default/no-photo.jpg">
                            </div>
                        {/if}
                    </a>
                </div>
                <div class="object-info row">
                    <div class="obj-title col-12"><a href="/product/{$product.mark}/">{$product.name}</a></div>
                    <div class="obj-short-desc col-12">{$product.short_desc}</div>
                    <div class="obj-price col-6">от {$product.price|number_format:2:" ":","} GEL</div>
                    <div class="obj-created col-6">{$product.created|date_format:"d.m.Y"}</div>
                </div>
            </div>
        {/foreach}
        </div>
    </div>
{/block}

{block name="scripts"}
    <script type="text/javascript">

    </script>
{/block}