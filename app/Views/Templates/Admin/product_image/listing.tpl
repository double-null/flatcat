{extends file="template.tpl"}

{block name="content"}

    <div class="title-block">
        <h3 class="title">
            <span> Изображения обьекта </span>
            {if empty($params)}
                <a href="/admin/product_images/create/{$productID}/" class="btn btn-primary btn-sm rounded-s">
                    Добавить
                </a>
            {else}
                <a href="/admin/product_parameters/mod/{$productID}/" class="btn btn-primary btn-sm rounded-s">
                    Редактировать
                </a>
            {/if}
        </h3>
        <p class="title-description">  </p>
    </div>

    <div class="card">
        <div class="card-block">
            <section id="content items-list-page">
                <div class="table-responsive item-list">
                    <div class="card items">
                        <ul class="item-list striped">
                            <li class="item item-list-header">
                                <div class="item-row">
                                    <div class="item-col item-col-header">
                                        <div><span> ID </span></div>
                                    </div>
                                    <div class="item-col item-col-header">
                                        <div><span> Изображение </span></div>
                                    </div>
                                    <div class="item-col item-col-header">
                                        <div><span> Имя </span></div>
                                    </div>
                                </div>
                            </li>
                            {foreach $photos as $photo}
                                <li class="item">
                                    <div class="item-row">
                                        <div class="item-col"><div>{$photo.id}</div></div>
                                        <div class="item-col"><img height="50px" src="/images/objects/{$photo.name}" /></div>
                                        <div class="item-col"><div>{$photo.name}</div></div>
                                    </div>
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
            </section>
        </div>
    </div>
{/block}