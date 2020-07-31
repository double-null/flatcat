{extends file="template.tpl"}

{block name="breadcrumbs"}
    <li><a href="/">{$common.main_page}</a></li>
    <li>{$inscriptions.title}</li>
{/block}

{block name="content"}
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{$inscriptions.title}</h2>
            </div>
        </div>
        <div class="row gray-block">
            <div class="col-md-6">
                <label>Поручите продажу «Владис» уже сегодня!</label>
                <ul class="excellent-list">
                    <li>Тысячи покупателей сразу узнают о вашем предложении.</li>
                    <li>Более 250 специалистов предложат своим клиентам-покупателям вашу недвижимость.</li>
                    <li>Более двух тысяч посетителей сайта ежедневно увидят её среди новых поступлений.</li>
                    <li>Вы платите только за результат – совершенную сделку. Никаких авансовых платежей.</li>
                </ul>
                <form class="feedback-form">
                    <div class="row">
                        <div class="col-md-4">
                            <input type="text" placeholder="Ваше имя">
                        </div>
                        <div class="col-md-4">
                            <input type="text" placeholder="Телефон">
                        </div>
                        <div class="col-md-4">
                            <button class="green-btn">Начать продажу</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-6">
                <img class="img-fluid" src="/themes/Flatcat/images/no.jpg">
            </div>
        </div>
        <div class="row">
            <div class="col-md-12" style="text-align: center;">
                <span class="sub-title">8 причин выбрать «Владис» для продажи недвижимости</span>
            </div>
        </div>
    </div>
{/block}