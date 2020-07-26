{extends file="template.tpl"}

{block name="content"}
    <div class="container">
        <div class="row">
            <div  class="col-md-4">
                <form id="fast-search" action="/search/">
                    <div class="row">
                        <div class="col-12">
                            <b>{$inscriptions.fast_search_title}</b>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="select">
                                <select name="deal">
                                    {foreach $variants[11] as $variant}
                                        <option value="{$variant.id}">{$variant.value}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="select">
                                <select name="type">
                                    {foreach $variants[10] as $variant}
                                        <option value="{$variant.id}">{$variant.value}</option>
                                    {/foreach}
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
                            <button class="green-btn">{$inscriptions.fast_search_btn}</button>
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
            <div class="col-12 main-title">{$inscriptions.reviews_title}</div>
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
                    <div class="col-4"><a href="/reviews/" class="green-btn">{$inscriptions.reviews_btn_text}</a></div>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-12 main-title">{$inscriptions.advantages_title}</div>
            <div id="advantages" class="col-md-6">
                {foreach $advantages as $advantage}
                    <div class="spoiler-item">
                        <div class="spoiler-head">
                            <div class="circle">{$advantage@iteration}</div>
                            {$advantage.title}
                        </div>
                        <div class="spoiler-body">
                            {$advantage.description}
                        </div>
                    </div>
                {/foreach}
            </div>
            <div class="col-md-6">
                <img class="img-fluid" src="/themes/Flatcat/images/no.jpg">
            </div>
        </div>

    </div>
{/block}