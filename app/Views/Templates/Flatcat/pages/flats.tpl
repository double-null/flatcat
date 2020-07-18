{extends file="template.tpl"}

{block name="html_title"}{/block}

{block name="filters"}
    <div id="filters-block" class="row">
        <form method="post" class="filters-list row">
            <div class="filters-item">
                <select multiple="multiple" placeholder="Комнат" class="SlectBox" name="rooms">
                    <option value="1">комнаты</option>
                    <option value="2">студия</option>
                    <option value="3">1-комнатные</option>
                    <option value="4">2-комнатные</option>
                    <option value="5">3-комнатные</option>
                    <option value="6">1-комнатные</option>
                    <option value="7">Многокомнатные</option>
                </select>
            </div>
            <div class="filters-item">
                <select multiple="multiple" placeholder="Материал" class="SlectBox" name="material">
                    <option value="1">кирпичный</option>
                    <option value="2">панельный</option>
                    <option value="3">монолитный</option>
                    <option value="4">кирпично-панельный</option>
                    <option value="4">кирпично-монолитный</option>
                    <option value="4">блок + утеплитель</option>
                    <option value="4">блочный</option>
                    <option value="4">каркасно-щитовой</option>
                    <option value="4">монолитно-блочный</option>
                    <option value="4">бетон</option>
                    <option value="4">блок-утеплитель</option>
                    <option value="4">блочно-монолитный</option>
                </select>
            </div>
            <div class="filters-item">
                Этаж <input type="text" name="min_floor" size="1"> - <input type="text" name="max_floor" size="1">
            </div>
            <div class="filters-item">
                Дом не ниже <input type="text" name="max_floor" size="1"> эт.
            </div>
            <div class="filters-item">
                <select multiple="multiple" placeholder="Отопление" class="SlectBox" name="heating">
                    <option value="1">Центральное</option>
                    <option value="2">Своя котельня</option>
                    <option value="3">Индивидуальный котёл</option>
                </select>
            </div>
            <div class="filters-item">
                <input id="check_new_build" type="checkbox" name="new_build" value="0">
                <label for="check_new_build">Без новостроек</label>
            </div>
            <div class="filters-item">
                <input id="check_reduced_price" type="checkbox" name="reduced_price" value="1">
                <label for="check_reduced_price">Цена снижена</label>
            </div>
            <div class="filters-item">
                <input id="check_superprice" type="checkbox" name="superprice" value="1">
                <label for="check_superprice">По суперцене</label>
            </div>
            <div class="filters-item">
                Цена <input type="text" name="min_price" size="5"> - <input type="text" name="max_price" size="5">
            </div>

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
            {foreach $flats as $flat}
                <div class="col-md-4 object-item">
                    <div style="width: 100%; position: relative;">
                        <a class="object-link" href="/object/{$categoryID}-{$flat.id}/">
                            {if !empty($flat.photos)}
                                {foreach $flat.photos|json_decode as $photo}
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
                        <div class="obj-title col-12"><a href="/object/{$categoryID}-{$flat.id}/">{$flat.name}</a></div>
                        <div class="obj-short-desc col-12">
                            {if !empty($flat.rooms)} {$flat.rooms}-комн {/if}
                            {if !empty($flat.max_floor) && !empty($flat.floor)}
                                , {$flat.floor}/{$flat.max_floor} эт
                            {/if}
                            {if !empty($flat.material)}, {$flat.material} {/if}
                        </div>
                        <div class="obj-price col-6">
                            от {$flat.price|number_format:2:" ":","}{$flat.money_type}
                        </div>
                        <div class="obj-created col-6">{$flat.created|date_format:"d.m.Y"}</div>
                    </div>
                </div>
            {/foreach}
        </div>
        <div class="row">
            <div class="pagination">
                {for $page=1 to ceil($totalProducts/30)}
                    {if $page == $currentPage}
                        <div class="current-page">{$page}</div>
                    {else}
                        <div class="page-link"><a href="/category/{$category.mark}/{$page}/">{$page}</a></div>
                    {/if}
                {/for}
            </div>
            <div id="totalProducts" style="display: none">{$totalProducts}</div>
        </div>
    </div>
{/block}