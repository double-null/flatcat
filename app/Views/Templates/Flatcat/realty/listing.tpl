{extends file="template.tpl"}

{block name="html_title"}{$categoryName}{/block}

{block name="filters"}
    <div id="filters-block" class="row">
        <form method="GET" class="filters-list row">
            {if $categoryID|in_array:[2]}
                <div class="filters-item">
                    {foreach $sVariants.deal as $variant}
                        <input type="radio" name="deal" value="{$variant@iteration}"> {$variant}
                    {/foreach}
                </div>
            {/if}
            {if $categoryID|in_array:[1]}
                <div class="filters-item">
                    <select multiple="multiple" placeholder="{$filters.rooms}" class="SlectBox" name="sub_type[]">
                        {foreach $sVariants.sub_types_1 as $variant}
                            <option value="{$variant@iteration}">{$variant}</option>
                        {/foreach}
                    </select>
                </div>
            {/if}
            <div class="filters-item">
                <select multiple="multiple" placeholder="{$filters.material}" class="SlectBox" name="material[]">
                    {foreach $sVariants.material as $variant}
                        <option value="{$variant@iteration}">{$variant}</option>
                    {/foreach}
                </select>
            </div>
            {if $categoryID|in_array:[1,2]}
                <div class="filters-item">
                    {$filters.floor} <input type="text" name="min_floor_d" size="1"> - <input type="text" name="max_floor_d" size="1">
                </div>
            {/if}
            {if $categoryID|in_array:[1]}
                <div class="filters-item">
                    {$filters.min_floor[0]} <input type="text" name="max_floor" size="1"> {$filters.min_floor[1]}
                </div>
            {/if}
            {if $categoryID|in_array:[1]}
                <div class="filters-item">
                    <select multiple="multiple" placeholder="{$filters.heating}" class="SlectBox" name="heating[]">
                        {foreach $sVariants.heating as $variant}
                            <option value="{$variant@iteration}">{$variant}</option>
                        {/foreach}
                    </select>
                </div>
            {/if}
            <div class="filters-item">
                {$filters.total_area[0]}
                <input type="text" name="min_area" size="5"> - <input type="text" name="max_area" size="5">
                {$filters.total_area[1]}
            </div>
            {if $categoryID|in_array:[1,2]}
                <div class="filters-item">
                    <input id="check_new_build" type="checkbox" name="new_build" value="0">
                    <label for="check_new_build">{$filters.without_new_build}</label>
                </div>
            {/if}
            {if $categoryID|in_array:[3,5]}
                <div class="filters-item">
                    {$filters.land_size[0]}
                    <input type="text" name="min_land_size" size="5">
                    -
                    <input type="text" name="max_land_size" size="5">
                    {$filters.land_size[1]}
                </div>
            {/if}
            {if $categoryID|in_array:[1]}
                <div class="filters-item">
                    <input id="check_reduced_price" type="checkbox" name="reduced_price" value="1">
                    <label for="check_reduced_price">{$filters.reduced_price}</label>
                </div>
            {/if}
            {if $categoryID|in_array:[1]}
                <div class="filters-item">
                    <input id="check_superprice" type="checkbox" name="superprice" value="1">
                    <label for="check_superprice">{$filters.superprice}</label>
                </div>
            {/if}
            <div class="filters-item">
                {$filters.price} <input type="text" name="min_price" size="5"> - <input type="text" name="max_price" size="5">
            </div>

            <div class="filter-submit"><button id="filter-send" type="submit" class="green-btn">{$inscriptions.find_btn}</button></div>
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
            {if !empty(($objects))}
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

                                        {if $photo@last}</span>{/if}

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
                                {if ($object.type == 1 && !empty($object.sub_type))}
                                    {$sVariants.sub_types_1[$object.sub_type-1]},
                                    {if !empty($object.max_floor) && !empty($object.floor)}
                                        , {$object.floor}/{$object.max_floor} эт
                                    {/if}
                                    {$sVariants.material[$object.material-1]}
                                {/if}
                                {if ($object.type|in_array:[3,4,5,6])}
                                    {if !empty($object.area_total)}{$sVariants.types[$object.type-1]}{/if}
                                    {if !empty($object.area_total)}{$object.area_total}{/if}
                                    {if !empty($object.material)}{$sVariants.material[$object.material-1]}{/if}
                                    {if !empty($object.land_size)}{$object.land_size}{/if}
                                {/if}
                                {if ($object.type == 7)}
                                    {if !empty($object.area_total)}{$sVariants.types[$object.type-1]}{/if}
                                    {$object.land_size}
                                {/if}
                            </div>
                            <div class="obj-price col-6">
                                {$object.price|number_format:2:" ":","}{$object.money_type}
                            </div>
                            <div class="obj-created col-6">{$object.created|date_format:"d.m.Y"}</div>
                        </div>
                    </div>
                {/foreach}
            {/if}
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