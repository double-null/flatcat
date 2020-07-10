{extends file="template.tpl"}

{block name="breadcrumbs"}
    <li><a href="/">Главная</a></li>
    <li>Отзывы</li>
{/block}

{block name="content"}
    <div class="container">
        <div class="row reviews-list">
            {foreach $reviews as $review}
                <div class="card col-md-4">
                    <div class="row card-border">
                        <div class="review-info">
                            <div class="col-12 review-agent"><a href="#">{$review.agentname}</a></div>
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
        </div>
    </div>
{/block}