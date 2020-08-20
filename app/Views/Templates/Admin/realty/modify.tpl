{extends file="template.tpl"}

{block name="html_title"} Админ панель &raquo; Редактирование обьекта #{$object.id}{/block}

{block name="content"}

    <div class="title-block">
        <h3 class="title">
            Редактирование обьекта #{$object.id}
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
                                <option value="1" {if ($object.deal == 1)}selected{/if}>Аренда</option>
                                <option value="2" {if ($object.deal == 2)}selected{/if}>Продажа</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Тип недвижимости: </label>
                        <div class="col-sm-10">
                            <select id="realty_type" class="c-select form-control boxed" name="Realty[type]">
                                <option value="0">Не выбрано</option>
                                <option value="1" {if ($object.type == 1)}selected{/if}>Квартира</option>
                                <option value="2" {if ($object.type == 2)}selected{/if}>Комната</option>
                                <option value="3" {if ($object.type == 3)}selected{/if}>Дом</option>
                                <option value="4" {if ($object.type == 4)}selected{/if}>Дача</option>
                                <option value="5" {if ($object.type == 5)}selected{/if}>Коттедж</option>
                                <option value="6" {if ($object.type == 6)}selected{/if}>Часть дома</option>
                                <option value="7" {if ($object.type == 7)}selected{/if}>Участок</option>
                                <option value="8" {if ($object.type == 8)}selected{/if}>Коммерческая</option>
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
                        <div class="col-sm-10"><input type="text" class="form-control boxed"
                              name="Realty[rooms]" value="{$object.rooms}"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Этажность: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control col-1" name="Realty[floor]" value="{$object.floor}"> /
                            <input type="text" class="form-control col-1" name="Realty[max_floor]" value="{$object.max_floor}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Общая площадь: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" name="Realty[area_total]" value="{$object.area_total}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Жилая площадь: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" name="Realty[area_live]" value="{$object.area_live}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Площадь кухни: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" name="Realty[area_kitchen]" value="{$object.area_kitchen}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Материал: </label>
                        <div class="col-sm-10">
                            <select class="c-select form-control boxed" name="Realty[material]">
                                <option value="1" {if ($object.material == 1)}selected{/if}>Кирпичный</option>
                                <option value="2" {if ($object.material == 2)}selected{/if}>Панельный</option>
                                <option value="3" {if ($object.material == 3)}selected{/if}>Монолитный</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Отопление: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Realty[heating]"
                              value="{$object.heating}"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Канализация: </label>
                        <div class="col-sm-10">
                            <select class="c-select form-control boxed" name="Realty[sewerage]">
                                <option value="0">Не заполнено</option>
                                <option value="1" {if ($object.sewerage == 1)}selected{/if}>Есть</option>
                                <option value="2" {if ($object.sewerage == 2)}selected{/if}>Нет</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Газ: </label>
                        <div class="col-sm-10">
                            <select class="c-select form-control boxed" name="Realty[gas]">
                                <option value="0">Не заполнено</option>
                                <option value="1" {if ($object.gas == 1)}selected{/if}>Есть</option>
                                <option value="2" {if ($object.gas == 2)}selected{/if}>Нет</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Вода: </label>
                        <div class="col-sm-10">
                            <select class="c-select form-control boxed" name="Realty[water]">
                                <option value="0">Не заполнено</option>
                                <option value="1" {if ($object.water == 1)}selected{/if}>Есть</option>
                                <option value="2" {if ($object.water == 2)}selected{/if}>Нет</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Минут до метро: </label>
                        <div class="col-sm-10">
                            <select class="c-select form-control boxed" name="Realty[distance_metro]">
                                <option value="0">Не заполнено</option>
                                <option value="1" {if ($object.distance_metro == 1)}selected{/if}>5</option>
                                <option value="2" {if ($object.distance_metro == 2)}selected{/if}>10</option>
                                <option value="3" {if ($object.distance_metro == 3)}selected{/if}>15</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Минут до моря: </label>
                        <div class="col-sm-10">
                            <select class="c-select form-control boxed" name="Realty[distance_sea]">
                                <option value="0">Не заполнено</option>
                                <option value="1" {if ($object.distance_sea == 1)}selected{/if}>5</option>
                                <option value="2" {if ($object.distance_sea == 2)}selected{/if}>10</option>
                                <option value="3" {if ($object.distance_sea == 3)}selected{/if}>15</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Ограничения: </label>
                        <div class="col-sm-10">
                            <label>
                                <input class="checkbox" type="checkbox" name="Realty[children]" {if $object.children == 1}checked{/if}>
                                <span>Можно с детьми</span>
                            </label>
                            <label>
                                <input class="checkbox" type="checkbox" name="Realty[animals]" {if $object.animals == 1}checked{/if}>
                                <span>Можно с животными</span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Новостройка: </label>
                        <div class="col-sm-10">
                            <label>
                                <input class="checkbox" type="checkbox" name="Realty[new_building]" {if $object.new_building == 1}checked{/if}>
                                <span>Да</span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Загородная: </label>
                        <div class="col-sm-10">
                            <label>
                                <input class="checkbox" type="checkbox" name="Realty[suburban]" {if $object.suburban == 1}checked{/if}>
                                <span>Да</span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Размер земельного участка (соток): </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Realty[land_size]" value="{$object.land_size}"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Цена за сотку: </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control boxed" name="Realty[land_unit_price]" value="{$object.land_unit_price}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Супер-цена: </label>
                        <div class="col-sm-10">
                            <label>
                                <input class="checkbox" type="checkbox" name="Realty[superprice]" value="{$object.superprice}">
                                <span>Да</span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Цена за метр: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Realty[unit_price]" value="{$object.unit_price}"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Цена: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Realty[price]" value="{$object.price}"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Валюта: </label>
                        <div class="col-sm-10">
                            <select class="c-select form-control boxed" name="Realty[money_type]">
                                <option value="1" {if $object.money_type == 1}selected{/if}>USD</option>
                                <option value="2" {if $object.money_type == 2}selected{/if}>GEL</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Код карты: </label>
                        <div class="col-sm-10">
                            <textarea class="form-control boxed" name="Realty[map]" cols="30" rows="10">{$object.map}</textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Код панорамы: </label>
                        <div class="col-sm-10">
                            <textarea class="form-control boxed" name="Realty[panorama]" cols="30" rows="10">{$object.panorama}</textarea>
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