{extends file="template.tpl"}

{block name="breadcrumbs"}
    <li><a href="/">Главная</a></li>
    <li>Агенты</li>
{/block}

{block name="content"}
    <div class="container">
        <div class="row">
            {foreach $users as $user}
                <div class="card col-md-4">
                    <div class="row card-border">
                        <div class="agent-photo col-md-4">
                            <img width="100%" src="{$user.photo}">
                        </div>
                        <div class="agent-info col-md-8">
                            <div class="col-12 agent-name"><a href="/agent/{$user.id}/">{$user.fullname}</a></div>
                            <div class="col-12 agent-position">{$user.position}</div>
                            <div class="col-12 agent-phone">{$user.phone}</div>
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>
    </div>
{/block}