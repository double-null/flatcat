{extends file="template.tpl"}

{block name="html_title"} Админ панель &raquo; Добавить квартиру{/block}

{block name="content"}

    <div class="title-block">
        <h3 class="title">
            Добавить квартиру
            <span data-type="bar" class="sparkline bar"></span>
        </h3>
    </div>

    <div class="card">
        <div class="card-block">
            <section>
                <form method="post">
                    {if !empty($success)}<span style="color: #4BCF99;">Квартира добавлена успешно</span>{/if}
                    {if !empty($error)}<span style="color: #FF4444;">{$error}</span>{/if}
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Тип сделки: </label>
                        <div class="col-sm-10">
                            <select class="c-select form-control boxed" name="Realty[deal]">
                                <option value="1">Аренда</option>
                                <option value="2">Продажа</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Название: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Realty[name]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Описание: </label>
                        <div class="col-sm-10">
                            <textarea class="form-control boxed" name="Realty[description]" cols="30" rows="10"></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Количество комнат: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Realty[rooms]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Этажность: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control col-1" name="Realty[floor]"> /
                            <input type="text" class="form-control col-1" name="Realty[max_floor]">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Общая площадь: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Realty[area_total]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Жилая площадь: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Realty[area_live]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Площадь кухни: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Realty[area_kitchen]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Материал: </label>
                        <div class="col-sm-10">
                            <select class="c-select form-control boxed" name="Realty[material]">
                                <option value="1">Кирпичный</option>
                                <option value="2">Панельный</option>
                                <option value="3">Монолитный</option>
                            </select>
                        </div>

                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Отопление: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Realty[heating]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Цена за метр: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Realty[heating]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Цена: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Realty[heating]"></div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary right">Добавить</button>
                    </div>
                </form>
            </section>
        </div>
    </div>
{/block}