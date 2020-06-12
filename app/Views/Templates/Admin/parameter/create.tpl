{extends file="template.tpl"}

{block name="content"}
    <div class="title-block">
        <h3 class="title">
            Добавление параметра обьекта
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
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Parameter[mark]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Название: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Parameter[name]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Тип параметра: </label>
                        <div class="col-sm-10">
                            <select class="c-select form-control boxed" name="Parameter[type]">
                                <option value="1">Текстовое поле</option>
                                <option value="2">Выбор (Да/Нет)</option>
                                <option value="3">Варианты</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Варианты выбора: </label>
                        <div class="col-sm-10">
                            <textarea class="form-control boxed" name="Parameter[options]" id="" cols="30" rows="10"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary right">Добавить</button>
                    </div>
                </form>
            </section>
        </div>
    </div>
{/block}