{extends file="template.tpl"}

{block name="html_title"} Админ панель &raquo; Просмотр описаний пользователя{/block}

{block name="content"}
    <div class="title-block">
        <h3 class="title">
            <span>Список описаний</span>
            <a href="/admin/user_desc/create/?user={$user.id}" class="btn btn-primary btn-sm rounded-s">
                Добавить описание
            </a>
        </h3>
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
                                        <div><span>ФИО</span></div>
                                    </div>
                                    <div class="item-col item-col-header">
                                        <div><span>Об Агенте</span></div>
                                    </div>
                                    <div class="item-col item-col-header">
                                        <div><span>Язык</span></div>
                                    </div>
                                    <div class="item-col item-col-header fixed item-col-actions-dropdown"></div>
                                </div>
                            </li>
                            {foreach $descriptions as $desc}
                                <li class="item">
                                    <div class="item-row">
                                        <div class="item-col item-col-sales"><div>{$desc.id}</div></div>
                                        <div class="item-col item-col-sales"><div>{$desc.fullname}</div></div>
                                        <div class="item-col item-col-sales"><div>{$desc.about}</div></div>
                                        <div class="item-col item-col-sales"><div>{$desc.lang}</div></div>
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
                                                            <a title="Удалить" class="remove" href="#" data-id="{$desc.id}" data-toggle="modal" data-target="#confirm-modal">
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

{block name="modal"}
    <div class="modal fade" id="confirm-modal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"><i class="fa fa-warning"></i> Внимание</h4>
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

{block name="scripts"}

    <script type="text/javascript">
        {literal}
        $('.remove').click(function () {
            $('#confirm-button').data('drop', $(this).data('id'));
        });
        $('#confirm-button').click(function () {
            var drop = $(this).data('drop');
            $.post({
                url: '/admin/user_desc/drop/',
                data: {id:drop},
                success: function(data){
                    if (data.status == 1) location.reload();
                },
                dataType: 'json'
            });
        });
        {/literal}
    </script>
{/block}