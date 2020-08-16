{extends file="template.tpl"}

{block name="html_title"}{$categoryName}{/block}

{block name="breadcrumbs"}
    <li><a href="/">{$common.main_page}</a></li>
    <li>{$categoryName}</li>
{/block}

{block name="content"}
    <div class="container">
        <div class="row">
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
        </div>
    </div>
{/block}