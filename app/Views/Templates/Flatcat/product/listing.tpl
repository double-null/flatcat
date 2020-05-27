{extends file="template.tpl"}

{block name="content"}
<div class="container">
    <div class="row">
    {foreach $products as $product}
        <div class="col-md-4">
            <div style="width: 100%; position: relative;">
                <a href="/product/{$product.mark}/">
                    <div id="object-photos">
                        <img class="img-fluid" src="https://vladis.ru/uploads/nb/med/419.jpg">
                    </div>
                    <span class="obj-hover-img">
                        <span class="obj-hover-img-5"></span>
                        <span class="obj-hover-img-5"></span>
                        <span class="obj-hover-img-5"></span>
                        <span class="obj-hover-img-5"></span>
                        <span class="obj-hover-img-5"></span>
                    </span>
                </a>
            </div>
            <div class="object-info row">
                <div class="obj-title col-12"><a href="/product/{$product.mark}/">{$product.name}</a></div>
                <div class="obj-short-desc col-12">{$product.short_desc}</div>
                <div class="obj-price col-6">от {$product.price|number_format:2:" ":","} GEL</div>
                <div class="obj-created col-6">{$product.created}</div>
            </div>
        </div>
    {/foreach}
    </div>
</div>
{/block}