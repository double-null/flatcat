{extends file="template.tpl"}

{block name="content"}

    <div class="title-block">
        <h3 class="title">
            <span>Характеристики обьекта</span>
            {if empty($params)}
                <a href="/admin/product_parameters/create/{$productID}/" class="btn btn-primary btn-sm rounded-s">
                    Добавить
                </a>
            {else}
                <a href="/admin/product_parameters/mod/{$productID}/" class="btn btn-primary btn-sm rounded-s">
                    Редактировать
                </a>
            {/if}
        </h3>
        <p class="title-description">  </p>
    </div>

    <div class="card">
        <div class="card-block">
            <section id="content items-list-page">
                <div class="table-responsive item-list">
                    <div class="card items">
                        <ul class="item-list striped">
                            <li class="item item-list-header">
                                <div class="item-row">
                                    <div class="item-col item-col-header">
                                        <div><span>ID</span></div>
                                    </div>
                                    <div class="item-col item-col-header">
                                        <div><span> Параметр </span></div>
                                    </div>
                                    <div class="item-col item-col-header">
                                        <div><span> Значение </span></div>
                                    </div>
                                </div>
                            </li>
                            {foreach $params as $param}
                                <li class="item">
                                    <div class="item-row">
                                        <div class="item-col item-col-sales"><div>{$param.id}</div></div>
                                        <div class="item-col item-col-sales"><div>{$param.name}</div></div>
                                        <div class="item-col item-col-sales"><div>{$param.value}</div></div>
                                    </div>
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
            </section>
        </div>
    </div>
{/block}