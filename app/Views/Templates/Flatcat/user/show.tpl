{extends file="template.tpl"}

{block name="html_title"}Агент {$user.fullname}{/block}

{block name="breadcrumbs"}
    <li><a href="/">Главная</a></li>
    <li><a href="/agents/">Агенты</a></li>
    <li>Агент {$user.fullname}</li>
{/block}

{block name="content"}
    <div class="container">
        <div class="row">
            {foreach $users as $user}
                <div class="agent-card col-md-4">
                    <div class="row">
                        <div class="agent-photo col-md-4">
                            <img width="100%" src="/images/users/{$user.photo}">
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