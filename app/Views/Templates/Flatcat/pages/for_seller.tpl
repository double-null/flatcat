{extends file="template.tpl"}

{block name="html_title"}{$inscriptions.title}{/block}

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
                <label>{$inscriptions.list_title}</label>
                <ul class="excellent-list">{$inscriptions.list}</ul>
                <form class="feedback-form">
                    <div class="row">
                        <div class="col-md-4">
                            <input type="text" placeholder="{$inscriptions.your_name}">
                        </div>
                        <div class="col-md-4">
                            <input type="text" placeholder="{$inscriptions.your_phone}">
                        </div>
                        <div class="col-md-4">
                            <button class="green-btn">{$inscriptions.seller_btn}</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-6">
                <img class="img-fluid" src="/themes/Flatcat/images/no.jpg">
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 m20" style="text-align: center;">
                <span class="sub-title">{$inscriptions.center_title}</span>
            </div>
        </div>
        <div id="advantages">
            {foreach $advantages as $advantage}
                <div class="row advantage">
                    <div class="col-md-6 m20">
                        <div class="row">
                            <div class="col-12">
                                <div class="advantage-title">
                                    <div class="advantage-num">{$advantage@iteration}</div>
                                    <span>{$advantage.title}</span>
                                </div>
                            </div>
                        </div>

                        <div class="advantage-description m20">{$advantage.description}</div>
                        <div class="advantage-btn m20">
                            <button class="gray-btn">{$advantage.button_title}</button>
                        </div>
                    </div>
                    <div class="col-md-6 m20">
                        <img src="/images/advantages/{$advantage.photo_name}">
                    </div>
                </div>
            {/foreach}
        </div>
    </div>
{/block}