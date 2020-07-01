{extends file="template.tpl"}

{block name="breadcrumbs"}
    <li><a href="/">Главная</a></li>
    <li><a href="/category/{$product.category_mark}/">{$product.category}</a></li>
    <li>{$product.name}</li>
{/block}

{block name="content"}
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <h2 class="object-name">{$product.name}</h2>
                <div class="object-short-desc">{$product.short_desc}</div>
                <div class="object-info">Код объекта: {$product.id} Добавлен: {$product.created|date_format:"d.m.Y"} </div>
            </div>
            <div class="col-md-4">
                <h1 class="object-price">{$product.price|number_format:2}</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="agent-card">
                    <div class="row">
                        <div class="col-md-4">
                            <img width="100%" src="/themes/Flatcat/images/unnamed.jpg" alt="" class="fluid-img">
                        </div>
                        <div class="col-md-8">
                            <div class="agent-name"><a href="#">{$product.user.fullname}</a></div>
                            <div class="agent-desc"> {$product.user.position} </div>
                            <div class="agent-contact"> {$product.user.phone} </div>
                            <div class="agent-order">
                                <a class="green-btn popup-open" data-id="2">Заказать просмотр</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="object-params">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="lined">
                                <span>Характеристика объекта</span>
                            </div>
                        </div>
                    </div>
                    {foreach $product_params as $param}
                        <div class="row">
                            <div class="col-6">{$param.name}</div>
                            <div class="col-6">{$param.value}</div>
                        </div>
                    {/foreach}
                </div>
                {if !empty($product.description)}
                <div class="object-description">
                    <div class="row">
                        <div class="col-12">
                            <div class="lined">
                                <span>Описание объекта</span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">{$product.description}</div>
                    </div>
                </div>
                {/if}
            </div>
            <div class="col-md-8">
                <div class="tabs">
                    <div class="tab">
                        <input type="radio" id="tab1" name="tab-group" checked>
                        <label for="tab1" class="tab-title">Фотографии</label>
                        <section class="tab-content">
                            <div class="product-images">
                                <div class="fotorama" data-nav="thumbs" data-height="400">
                                    {foreach $product_photos as $photo}
                                        <img class="img-fluid" src="/images/objects/original/{$photo.name}">
                                    {/foreach}
                                </div>
                            </div>
                        </section>
                    </div>
                    {if !empty($product.map)}
                    <div class="tab">
                        <input type="radio" id="tab2" name="tab-group">
                        <label for="tab2" class="tab-title">На карте</label>
                        <section class="tab-content">
                            <div class="product-map">
                                {$product.map}
                            </div>
                        </section>
                    </div>
                    {/if}
                    {if !empty($product.panorama)}
                    <div class="tab">
                        <input type="radio" id="tab3" name="tab-group">
                        <label for="tab3" class="tab-title">Панорама</label>
                        <section class="tab-content">
                            <div class="product-map">{$product.panorama}</div>
                        </section>
                    </div>
                    {/if}
                </div>
            </div>
        </div>
    </div>

    <div class="popup-fade" data-id="2">
        <div class="popup">
            <a class="popup-close" href="#">×</a>
            <span class="popup-title">Забронировать онлайн</span>
            <form method="post">
                <div class="row">
                    <label class="col-md-6">Контактное лице <b style="color: red">*</b></label>
                    <input class="col-md-6" type="text" name="Request[name]">
                </div>
                <div class="row">
                    <label class="col-md-6">Телефон <b style="color: red">*</b></label>
                    <input class="col-md-6" type="text" name="Request[phone]">
                </div>
                <div class="row">
                    <label class="col-md-6">Дата просмотра <b style="color: red">*</b></label>
                    <input class="col-md-6" type="text" name="Request[period]">
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <input id="acceptchk" type="checkbox" name="accept" value="on">
                        <span class="small">Даю согласие на обработку указанных персональных данных.</span>
                    </div>
                </div>
                <div class="row">
                    <input class="green-btn" type="submit" value="Отправить">
                </div>
            </form>
        </div>
    </div>

{/block}