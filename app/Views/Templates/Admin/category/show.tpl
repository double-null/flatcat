{extends file="template.tpl"}

{block name="content"}
    <div class="card">
        <div class="card-block">
            <div class="card-title-block">
                <h3 class="title">Категория {$category.mark}</h3>
            </div>
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
                                        <div><span>Метка</span></div>
                                    </div>
                                    <div class="item-col item-col-header fixed item-col-actions-dropdown"></div>
                                </div>
                            </li>

                                <li class="item">
                                    <div class="item-row">
                                        <div class="item-col item-col-sales">
                                            <div>{$category.id}</div>
                                        </div>
                                        <div class="item-col item-col-sales">
                                            <div class="item-heading">Sales</div>
                                            <div>{$category.mark}</div>
                                        </div>
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
                                                                <i class="fa fa-trash-o" aria-hidden="true"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a title="Просмотр" class="descriptions" href="/admin/category/show/{$category.id}/">
                                                                <i class="fa fa-eye" aria-hidden="true"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a title="Редактирование" class="descriptions" href="/admin/category/edit/{$category.id}/">
                                                                <i class="fa fa-pencil" aria-hidden="true"></i>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>

                        </ul>
                    </div>
                </div>
            </section>
        </div>
    </div>
{/block}

{block name="modal"}
    <div class="modal fade" id="confirm-modal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"><i class="fa fa-warning"></i> Alert</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Подтверждаем удаление?</p>
                </div>
                <div class="modal-footer">
                    <button id="confirm-button" type="button" class="btn btn-primary" data-dismiss="modal" data-status="1" data-drop="0">Да</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Нет</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
{/block}