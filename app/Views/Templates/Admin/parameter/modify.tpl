{extends file="template.tpl"}

{block name="html_title"}Админ панель &raquo; Редактирование параметра обьекта{/block}

{block name="content"}
    <div class="title-block">
        <h3 class="title">
            Редактирование параметра (поля) обьекта
            <span data-type="bar" class="sparkline bar"></span>
        </h3>
    </div>
    <div class="card">
        <div class="card-block">
            <section>
                <form method="post">
                    {if !empty($success)}<span style="color: #4BCF99;">Описание добавлено</span>{/if}
                    {if !empty($error)}<span style="color: #FF4444;">{$error}</span>{/if}
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Метка (ENG): </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" name="Parameter[mark]"
                                   value="{$parameter.mark}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Название: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" name="Parameter[name]"
                                   value="{$parameter.name}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Тип параметра: </label>
                        <div class="col-sm-10">
                            <select class="c-select form-control boxed" name="Parameter[type]">
                                <option value="1" {if ($parameter.type == 1)}selected{/if}>Текстовое поле</option>
                                <option value="2" {if ($parameter.type == 2)}selected{/if}>Выбор (Да/Нет)</option>
                                <option value="3" {if ($parameter.type == 3)}selected{/if}>Варианты</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Варианты выбора: </label>
                        <div class="col-sm-10">
                            <textarea class="form-control boxed" name="Parameter[options]" id="" cols="30"
                                      rows="10">{if !empty($parameter.options)}{foreach $parameter.options|json_decode as $option}{$option}&#13;&#10;{/foreach}{/if}</textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Фильтр: </label>
                        <div class="col-sm-10">
                            <label>
                                <input type="checkbox" class="checkbox" name="Parameter[filter]" value="1"
                                       {if ($parameter.filter == 1)}checked{/if}>
                                <span>выполнять фильтрацию по данному полю</span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Скрытый: </label>
                        <div class="col-sm-10">
                            <label>
                                <input type="checkbox" class="checkbox" name="Parameter[hidden]" value="1"
                                       {if ($parameter.hidden == 1)}checked{/if}>
                                <span>скрыть в списке характеристик</span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary right">Редактировать</button>
                    </div>
                </form>
            </section>
        </div>
    </div>
{/block}