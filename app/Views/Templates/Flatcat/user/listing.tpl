{extends file="template.tpl"}

{block name="html_title"}{$categoryName}{/block}

{block name="breadcrumbs"}
    <li><a href="/">{$common.main_page}</a></li>
    <li>{$categoryName}</li>
{/block}

{block name="content"}
    <div class="container">
        <div class="row">
            {foreach $users as $user}
                <div class="card col-md-4">
                    <div class="row card-border">
                        <div class="agent-photo col-md-4">
                            {if !empty($user.photo)}
                                <img width="100%" src="{$user.photo}">
                            {else}
                                <img width="100%" src="/themes/Flatcat/images/unnamed.jpg">
                            {/if}
                        </div>
                        <div class="agent-info col-md-8">
                            <div class="col-12 agent-name">
                                <a href="/agent/{$user.id}/">
                                    {if !empty($user.fullname)}{$user.fullname}{/if}
                                </a>
                            </div>
                            <div class="col-12 agent-position">{$user.position}</div>
                            <div class="col-12 agent-phone">{$user.phone}</div>
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>
    </div>
{/block}