{extends file="template.tpl"}

{block name="content"}

    <div class="title-block">
        <h3 class="title">
            <span>Список обьектов</span>
            <a href="/admin/product/create/" class="btn btn-primary btn-sm rounded-s">
                Добавить
            </a>
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
                                        <div><span>Обьект</span></div>
                                    </div>
                                    <div class="item-col item-col-header">
                                        <div><span>Категория</span></div>
                                    </div>
                                    <div class="item-col item-col-header fixed item-col-actions-dropdown"></div>
                                </div>
                            </li>
                            {foreach $products as $product}
                                <li class="item">
                                    <div class="item-row">
                                        <div class="item-col item-col-sales"><div>{$product.id}</div></div>
                                        <div class="item-col item-col-sales"><div>{$product.mark}</div></div>
                                        <div class="item-col item-col-sales"><div>{$product.category}</div></div>
                                        <div class="item-col fixed item-col-actions-dropdown">
                                            <div class="item-actions-dropdown">
                                                <a class="item-actions-toggle-btn">
                                                <span class="inactive">
                                                    <i class="fa fa-cog"></i>
                                                </span>
                                                    <span class="active">
                                                    <i class="fa fa-chevron-circle-right"></i>
                                                </span>
                                                </a>
                                                <div class="item-actions-block">
                                                    <ul class="item-actions-list">
                                                        <li>
                                                            <a title="Удалить" class="remove" href="#" data-id="{$product.id}" data-toggle="modal" data-target="#confirm-modal">
                                                                <i class="fa fa-trash-o "></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a title="Просмотр" href="/admin/product/show/{$product.id}/">
                                                                <i class="fa fa-eye" aria-hidden="true"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a title="Описания обьекта" class="descriptions" href="/admin/product_desc/{$product.id}/">
                                                                <i class="fa fa-file-text-o" aria-hidden="true"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a title="Изображения обьекта"  href="/admin/product_images/listing/{$product.id}/">
                                                                <i class="fa fa-picture-o" aria-hidden="true"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a title="Характеристики"  href="/admin/product_parameters/listing/{$product.id}/">
                                                                <i class="fa fa-cogs" aria-hidden="true"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a title="Карты и панорамы"  href="/admin/product_parameters/listing/{$product.id}/">
                                                                <i class="fa fa-file-code-o" aria-hidden="true"></i>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
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