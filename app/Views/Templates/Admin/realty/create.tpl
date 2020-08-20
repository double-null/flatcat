{extends file="template.tpl"}

{block name="html_title"} Админ панель &raquo; Добавление обьекта{/block}

{block name="content"}

    <div class="title-block">
        <h3 class="title">
            Добавление обьекта
            <span data-type="bar" class="sparkline bar"></span>
        </h3>
    </div>

    <div class="card">
        <div class="card-block">
            <section>
                <form method="post">
                    {if !empty($success)}<span style="color: #4BCF99;">Обьект добавлен успешно</span>{/if}
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
                        <label class="col-sm-2 form-control-label text-xs-right"> Тип недвижимости: </label>
                        <div class="col-sm-10">
                            <select id="realty_type" class="c-select form-control boxed" name="Realty[type]">
                                <option value="0">Не выбрано</option>
                                <option value="1">Квартира</option>
                                <option value="2">Комната</option>
                                <option value="3">Дом</option>
                                <option value="4">Дача</option>
                                <option value="5">Коттедж</option>
                                <option value="6">Часть дома</option>
                                <option value="7">Участок</option>
                                <option value="8">Коммерческая</option>
                                <option value="9">Гараж / Стоянка</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Категория: </label>
                        <div class="col-sm-10">
                            <select id="realty_sub_type" class="c-select form-control boxed" name="Realty[sub_type]">
                            </select>
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
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" name="Realty[area_total]">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Жилая площадь: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" name="Realty[area_live]">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Площадь кухни: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" name="Realty[area_kitchen]">
                        </div>
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
                        <label class="col-sm-2 form-control-label text-xs-right"> Канализация: </label>
                        <div class="col-sm-10">
                            <select class="c-select form-control boxed" name="Realty[sewerage]">
                                <option value="0">Не заполнено</option>
                                <option value="1">Есть</option>
                                <option value="2">Нет</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Газ: </label>
                        <div class="col-sm-10">
                            <select class="c-select form-control boxed" name="Realty[gas]">
                                <option value="0">Не заполнено</option>
                                <option value="1">Есть</option>
                                <option value="2">Нет</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Вода: </label>
                        <div class="col-sm-10">
                            <select class="c-select form-control boxed" name="Realty[water]">
                                <option value="0">Не заполнено</option>
                                <option value="1">Есть</option>
                                <option value="2">Нет</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Минут до метро: </label>
                        <div class="col-sm-10">
                            <select class="c-select form-control boxed" name="Realty[distance_metro]">
                                <option value="0">Не заполнено</option>
                                <option value="1">5</option>
                                <option value="2">10</option>
                                <option value="3">15</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Минут до моря: </label>
                        <div class="col-sm-10">
                            <select class="c-select form-control boxed" name="Realty[distance_sea]">
                                <option value="0">Не заполнено</option>
                                <option value="1">5</option>
                                <option value="2">10</option>
                                <option value="3">15</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Ограничения: </label>
                        <div class="col-sm-10">
                            <label>
                                <input class="checkbox" type="checkbox" name="Realty[children]">
                                <span>Можно с детьми</span>
                            </label>
                            <label>
                                <input class="checkbox" type="checkbox" name="Realty[animals]">
                                <span>Можно с животными</span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Новостройка: </label>
                        <div class="col-sm-10">
                            <label>
                                <input class="checkbox" type="checkbox" name="Realty[new_building]">
                                <span>Да</span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Загородная: </label>
                        <div class="col-sm-10">
                            <label>
                                <input class="checkbox" type="checkbox" name="Realty[suburban]">
                                <span>Да</span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Размер земельного участка (соток): </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Realty[land_size]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Цена за сотку: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" name="Realty[land_unit_price]">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Супер-цена: </label>
                        <div class="col-sm-10">
                            <label>
                                <input class="checkbox" type="checkbox" name="Realty[superprice]">
                                <span>Да</span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Цена за метр: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Realty[unit_price]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Цена: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Realty[price]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Валюта: </label>
                        <div class="col-sm-10">
                            <select class="c-select form-control boxed" name="Realty[money_type]">
                                <option value="1">USD</option>
                                <option value="2">GEL</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Код карты: </label>
                        <div class="col-sm-10">
                            <textarea class="form-control boxed" name="Realty[map]" cols="30" rows="10"></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Код панорамы: </label>
                        <div class="col-sm-10">
                            <textarea class="form-control boxed" name="Realty[panorama]" cols="30" rows="10"></textarea>
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

{block name="scripts"}
    <script type="text/javascript">
        $("#realty_type").change(function() {
            let a = [];
            a[1] = ['Студия', '1-комнатная', '2-комнатная', '3-комнатная', 'Многокомнатная'];
            a[8] = ['Офис', 'Торговая', 'Производство / Склад', 'Земельные участки', 'Готовый бизнес', 'Другое'];
            $("#realty_sub_type").empty();
            $.each(a[$(this).val()], function(key, value){
                $("#realty_sub_type").append($(new Option(value, key+1)));
            });
        });
    </script>
{/block}