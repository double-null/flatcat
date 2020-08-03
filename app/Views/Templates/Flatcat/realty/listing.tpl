{extends file="template.tpl"}

{block name="html_title"}{/block}

{block name="filters"}
    <div id="filters-block" class="row">
        <form method="GET" class="filters-list row">
            {if $categoryID|in_array:[2]}
                <div class="filters-item">
                    {foreach $variants[11] as $variant}
                        <input type="radio" name="deal" value="{$variant.id}"> {$variant.value}
                    {/foreach}
                </div>
            {/if}
            {if $categoryID|in_array:[1]}
                <div class="filters-item">
                    <select multiple="multiple" placeholder="{$filters[1].value}" class="SlectBox" name="rooms[]">
                        {foreach $variants[1] as $variant}
                            <option value="{$variant.id}">{$variant.value}</option>
                        {/foreach}
                    </select>
                </div>
            {/if}
            <div class="filters-item">
                <select multiple="multiple" placeholder="{$filters[2].value}" class="SlectBox" name="material[]">
                    {foreach $variants[2] as $variant}
                        <option value="{$variant.id}">{$variant.value}</option>
                    {/foreach}
                </select>
            </div>
            {if $categoryID|in_array:[1,2]}
                <div class="filters-item">
                    {$filters[3].value} <input type="text" name="min_floor_d" size="1"> - <input type="text" name="max_floor_d" size="1">
                </div>
            {/if}
            {if $categoryID|in_array:[1]}
                <div class="filters-item">
                    {$filters[4].value} <input type="text" name="max_floor" size="1"> {$filters[4].additional}
                </div>
            {/if}
            {if $categoryID|in_array:[1]}
                <div class="filters-item">
                    <select multiple="multiple" placeholder="{$filters[5].value}" class="SlectBox" name="heating[]">
                        {foreach $variants[5] as $variant}
                            <option value="{$variant.id}">{$variant.value}</option>
                        {/foreach}
                    </select>
                </div>
            {/if}
            <div class="filters-item">
                {$filters[12].value}
                <input type="text" name="min_area" size="5"> - <input type="text" name="max_area" size="5">
                {$filters[12].additional}
            </div>
            {if $categoryID|in_array:[1,2]}
                <div class="filters-item">
                    <input id="check_new_build" type="checkbox" name="new_build" value="0">
                    <label for="check_new_build">{$filters[6].value}</label>
                </div>
            {/if}
            {if $categoryID|in_array:[3,5]}
                <div class="filters-item">
                    {$filters[13].value}
                    <input type="text" name="min_land_size" size="5">
                    -
                    <input type="text" name="max_land_size" size="5">
                    {$filters[13].additional}
                </div>
            {/if}
            {if $categoryID|in_array:[1]}
                <div class="filters-item">
                    <input id="check_reduced_price" type="checkbox" name="reduced_price" value="1">
                    <label for="check_reduced_price">{$filters[7].value}</label>
                </div>
            {/if}
            {if $categoryID|in_array:[1]}
                <div class="filters-item">
                    <input id="check_superprice" type="checkbox" name="superprice" value="1">
                    <label for="check_superprice">{$filters[8].value}</label>
                </div>
            {/if}
            <div class="filters-item">
                {$filters[9].value} <input type="text" name="min_price" size="5"> - <input type="text" name="max_price" size="5">
            </div>

            <div class="filter-submit"><button id="filter-send" type="submit" class="green-btn">Найти</button></div>
        </form>
    </div>
{/block}

{block name="breadcrumbs"}
    <li><a href="/">{$common.main_page}</a></li>
    <li>{$categoryName}</li>
{/block}

{block name="content"}
    <div class="container">
        <div class="row">
            {foreach $objects as $object}
                <div class="col-md-4 object-item">
                    <div style="width: 100%; position: relative;">
                        <a class="object-link" href="/object/{$categoryID}-{$object.id}/">
                            {if !empty($object.photos|json_decode)}
                                {foreach $object.photos|json_decode as $photo}
                                    {if $photo@first}
                                        <div class="object-photos">
                                            <img class="img-fluid" src="/images/objects/mini/{$photo}">
                                        </div>
                                        <span class="obj-hover-img">
                                    {/if}

                                    {if $photo@iteration <= 5}<span class="obj-hover-img-5" data-photo="{$photo}"></span>{/if}

                                    {if $photo@last}
                                        </span>
                                    {/if}
                                {/foreach}
                            {else}
                                <div class="object-photos">
                                    <img class="img-fluid" src="/images/default/no-photo.jpg">
                                </div>
                            {/if}
                        </a>
                    </div>
                    <div class="object-info row">
                        <div class="obj-title col-12"><a href="/object/{$categoryID}-{$object.id}/">{$object.name}</a></div>
                        <div class="obj-short-desc col-12">
                            {if ($object.type == 1)}
                                {if !empty($object.rooms)} {$object.rooms}-комн {/if}
                                {if !empty($object.max_floor) && !empty($object.floor)}
                                    , {$object.floor}/{$object.max_floor} эт
                                {/if}
                                {if !empty($object.material)}, {$object.material} {/if}
                            {/if}
                            {if ($object.type|in_array:[3,4,5,6])}
                                {foreach $variants[10] as $variant}
                                    {if $object.type == $variant.id}{$variant.value}{/if}
                                {/foreach}
                                {if !empty($object.area_total)}{$object.area_total}{/if}
                                {if !empty($object.material)}{$object.material}{/if}
                                {if !empty($object.land_size)}{$object.land_size}{/if}
                            {/if}
                            {if ($object.type == 7)}
                                {foreach $variants[10] as $variant}
                                    {if $object.type == $variant.id}{$variant.value}{/if}
                                {/foreach}
                                {$object.land_size}
                            {/if}
                        </div>
                        <div class="obj-price col-6">
                            от {$object.price|number_format:2:" ":","}{$object.money_type}
                        </div>
                        <div class="obj-created col-6">{$object.created|date_format:"d.m.Y"}</div>
                    </div>
                </div>
            {/foreach}
        </div>
        <div class="row">
            <div class="pagination">
                {for $page=1 to ceil($totalProducts/10)}
                    {if $page == $currentPage}
                        <div class="current-page">{$page}</div>
                    {else}
                        <div class="page-link"><a href="{$currentUrl}page={$page}">{$page}</a></div>
                    {/if}
                {/for}
            </div>
        </div>
    </div>
{/block}