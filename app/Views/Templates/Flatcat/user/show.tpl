{extends file="template.tpl"}

{block name="html_title"}{$user.fullname}{/block}

{block name="breadcrumbs"}
    <li><a href="/">{$common.main_page}</a></li>
    <li>{$categoryName}</li>
    <li>{$user.fullname}</li>
{/block}

{block name="content"}
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="agent-name">{$user.fullname}</h2>
                <div class="agent-code">{$inscriptions.agent_code}: <b>{$user.id}</b></div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                <div class="row">
                    <div class="col-md-6">
                        {if !empty($user.photo)}
                            <img width="100%" src="{$user.photo}">
                        {else}
                            <img width="100%" src="/themes/Flatcat/images/unnamed.jpg">
                        {/if}
                    </div>
                    <div class="col-md-6">
                        {if !empty($user.position)}<p> {$inscriptions.position}: {$user.position} </p>{/if}
                        <p> {$inscriptions.email}: {$user.email}</p>
                        <p> {$inscriptions.phone}: {$user.phone}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="lined">
                            <span>{$inscriptions.about}</span>
                        </div>
                    </div>
                    <div class="col-12">
                        <p> {if !empty($user.about)}{$user.about}{else}{$inscriptions.no_info}{/if} </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="row">
                    <div class="col-12">
                        <div class="lined"><span>{$inscriptions.form_title}</span></div>
                    </div>
                </div>
                <form class="agent-form" method="post">
                    <div class="row">
                        <div class="col-6"><input type="text" placeholder="{$inscriptions.your_name}"></div>
                        <div class="col-6"><input type="text" placeholder="{$inscriptions.your_phone}"></div>
                        <div class="col-12">
                            <textarea name="message" id="" cols="30" rows="10" placeholder="{$inscriptions.your_message}"></textarea>
                        </div>
                        <div class="col-12">
                            <input type="checkbox" name="confirm">
                            <span class="small">{$inscriptions.confirm_data}</span>
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
                <div class="lined"><span>{$inscriptions.reviews}</span></div>
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
                <div class="col-12">{$inscriptions.empty_reviews}</div>
            {/foreach}
        </div>
    </div>
{/block}