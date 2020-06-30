{extends file="template.tpl"}

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
                                    <span class="obj-hover-img-5" data-photo="{$photo}"></span>
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