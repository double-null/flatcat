{extends file="template.tpl"}

{block name="content"}

    <div class="title-block">
        <h3 class="title">
            <span>Список описаний для параметра "{$parameter.mark}"</span>
            <a href="/admin/param_desc/create/{$parameter.id}/" class="btn btn-primary btn-sm rounded-s">
                Добавить
            </a>
        </h3>
        <p class="title-description"> Описания параметров на разных языках </p>
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
                                        <div><span>Язык</span></div>
                                    </div>
                                    <div class="item-col item-col-header">
                                        <div><span>Параметр (Категория)</span></div>
                                    </div>
                                    <div class="item-col item-col-header">
                                        <div><span>Название</span></div>
                                    </div>
                                    <div class="item-col item-col-header">
                                        <div><span>Ед. измерения</span></div>
                                    </div>
                                    <div class="item-col item-col-header fixed item-col-actions-dropdown"></div>
                                </div>
                            </li>
                            {foreach $descriptions as $desc}
                                <li class="item">
                                    <div class="item-row">
                                        <div class="item-col item-col-sales"><div>{$desc.id}</div></div>
                                        <div class="item-col item-col-sales"><div>{$desc.lang}</div></div>
                                        <div class="item-col item-col-sales">
                                            <div>{$desc.param} ({$desc.category})</div>
                                        </div>
                                        <div class="item-col item-col-sales"><div>{$desc.name}</div></div>
                                        <div class="item-col item-col-sales"><div>{$desc.unit}</div></div>
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
                                                            <a title="Удалить" class="remove" href="#" data-id="{$category.id}" data-toggle="modal" data-target="#confirm-modal">
                                                                <i class="fa fa-trash-o "></i>
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