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
        <div class="row">
            <div class="col-12">
                <div class="about-media">{$inscriptions.media}</div>
                <div class="text-content">{$inscriptions.content}</div>
            </div>
        </div>
    </div>
{/block}