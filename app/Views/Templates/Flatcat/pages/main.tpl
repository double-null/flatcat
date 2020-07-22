{extends file="template.tpl"}

{block name="content"}
    <div class="container">
        <div class="row">
            <div  class="col-md-4">
                <form id="fast-search">
                    <div class="row">
                        <div class="col-12">
                            <b>Быстрый поиск недвижимости</b>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="select">
                                <select name="deal">
                                    <option value="1">Купить</option>
                                    <option value="2">Снять</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="select">
                                <select name="type">
                                    <option value="1">Квартира</option>
                                    <option value="2">Комната</option>
                                    <option value="3">Дом</option>
                                    <option value="4">Дачу</option>
                                    <option value="5">Коттедж</option>
                                    <option value="6">Часть дома</option>
                                    <option value="7">Участок</option>
                                    <option value="8">Коммерческую</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="select">
                                <select name="sub-type">
                                    <option></option>
                                    <option>Выбрать все</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6"><input type="text" name="min_price" placeholder="Цена от"></div>
                        <div class="col-6"><input type="text" name="max_price" placeholder="Цена до"></div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <button class="green-btn">Найти</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-8 owl-carousel owl-theme">
                <div><img src="https://vladis.ru/uploads/posters/613.jpg"></div>
                <div><img src="https://vladis.ru/uploads/posters/600.jpg"></div>
                <div>3</div>
                <div>4</div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 main-title">Отзывы клиентов</div>
            {foreach $reviews as $review}
                <div class="card col-md-4">
                    <div class="row card-border">
                        <div class="card-info">
                            <div class="col-12 review-agent"><a href="/agent/{$review.user}/">{$review.agentname}</a></div>
                            <div class="col-12 review-client">{$review.name}</div>
                            <div class="col-12 review-content">{$review.content}</div>
                            <div class="col-12 review-photos">
                                <div class="row">
                                    {foreach $review.photos|json_decode as $photo}
                                        <div class="col-md-6"><img class="img-fluid" src="/images/reviews/{$photo}"></div>
                                    {/foreach}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            {/foreach}

            <div class="col-12">
                <div class="row center">
                    <div class="col-4"><a href="/reviews/" class="green-btn">Смотреть все отзывы</a></div>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-12 main-title">8 причин выбрать «Владис» для продажи недвижимости</div>
            <div id="advantages" class="col-md-6">
                <div class="spoiler-item">
                    <div class="spoiler-head">
                        <div class="circle">1</div>
                        Лидер рынка недвижимости в России
                    </div>
                    <div class="spoiler-body">
                        <p>
                        «Владис» признали лучшим агентством недвижимости в России численностью более 100 сотрудников в рамках ХХ Национального конгресса по недвижимости 2016 в Екатеринбурге.
                        </p>
                    </div>
                </div>
                <div class="spoiler-item">
                    <div class="spoiler-head">
                        <div class="circle">2</div>
                        Мощнейшая профессиональная сеть продаж
                    </div>
                    <div class="spoiler-body">
                        <p>
                            Более 250 менеджеров по продажам и 50 агентств-партнеров сразу начнут предлагать ваш объект своим покупателям. Все специалисты компании являются профессионалами своего дела и постоянно повышают квалификацию
                        </p>
                    </div>
                </div>
                <div class="spoiler-item">
                    <div class="spoiler-head">
                        <div class="circle">3</div>
                        Тысячи продавцов не могут ошибаться
                    </div>
                    <div class="spoiler-body">
                        <p>
                            Более 3000 продавцов сотрудничают с «Владис» прямо сейчас. Они с уверенностью доверили нам самое дорогое.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <img class="img-fluid" src="/themes/Flatcat/images/no.jpg">
            </div>
        </div>

    </div>
{/block}