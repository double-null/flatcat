{extends file="template.tpl"}

{block name="html_title"}Агент - {$user.fullname}{/block}

{block name="breadcrumbs"}
    <li><a href="/">Главная</a></li>
    <li><a href="/agents/">Агенты</a></li>
    <li>Агент {$user.fullname}</li>
{/block}

{block name="content"}
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="agent-name">{$user.fullname}</h2>
                <div class="agent-code">Код агента: <b>{$user.id}</b></div>
                <div class="object-short-desc">{$user.position}</div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                <div class="row">
                    <div class="col-md-6">
                        <img class="img-fluid" src="{$user.photo}">
                    </div>
                    <div class="col-md-6">
                        {if !empty($user.position)}<p> Должность: {$user.position} </p>{/if}
                        <p> E-Mail: {$user.email}</p>
                        <p> Телефон: {$user.phone}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="lined">
                            <span>О себе</span>
                        </div>
                    </div>
                    <div class="col-12">
                        <p> {if !empty($user.about)}{$user.about}{else}Нет информации{/if} </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="row">
                    <div class="col-12">
                        <div class="lined"><span>Связаться с агентом</span></div>
                    </div>
                </div>
                <form class="agent-form" method="post">
                    <div class="row">
                        <div class="col-6"><input type="text" placeholder="Ваше имя"></div>
                        <div class="col-6"><input type="text" placeholder="Ваш телефон"></div>
                        <div class="col-12">
                            <textarea name="message" id="" cols="30" rows="10" placeholder="Ваше сообщение"></textarea>
                        </div>
                        <div class="col-12">
                            <input type="checkbox" name="confirm">
                            <span class="small">Даю согласие на обработку указанных персональных данных.</span>
                        </div>
                        <div class="col-12">
                            <input class="green-btn" type="submit" value="Отправить">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="lined"><span>Отзывы об агенте</span></div>
            </div>
        </div>
        <div class="row">
            {foreach $reviews as $review}
                <div class="card col-md-4">
                    <div class="row card-border">
                        <div class="card-info">
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
            {foreachelse}
                <div class="col-12">Пока ещё нет отзывов о данном агенте</div>
            {/foreach}
        </div>
    </div>
{/block}