{extends file="template.tpl"}

{block name="breadcrumbs"}
    <li><a href="/">{$common.main_page}</a></li>
    <li><a href="/category/{$categoryID}/">{$categoryName}</a></li>
    <li>{$object.name}</li>
{/block}

{block name="content"}
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <h2 class="object-name">{$object.name}</h2>
                <div class="object-short-desc"></div>
                <div class="object-info">
                    {$inscriptions.object_code}: {$object.id}
                    {$inscriptions.created_date}: {$object.created|date_format:"d.m.Y"}
                </div>
            </div>
            <div class="col-md-4">
                <h1 class="object-price">{$object.price|number_format:2} {$object.money_type}</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="agent-card">
                    <div class="row">
                        <div class="col-md-4">
                            {if !empty($agent.photo)}
                                <img width="100%" src="{$user.photo}">
                            {else}
                                <img width="100%" src="/themes/Flatcat/images/unnamed.jpg">
                            {/if}
                        </div>
                        <div class="col-md-8">
                            <div class="agent-name"><a href="/agent/{$agent.id}/">{$agent.fullname}</a></div>
                            <div class="agent-desc"> {$agent.position} </div>
                            <div class="agent-contact"> {$agent.phone} </div>
                            <div class="agent-order">
                                <a class="green-btn popup-open" data-id="2">{$inscriptions.preview_order}</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="object-params">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="lined">
                                <span>{$inscriptions.object_params}</span>
                            </div>
                        </div>
                    </div>
                    {if $object.rooms != null}
                        <div class="row">
                            <div class="col-6">{$parameters.rooms}</div>
                            <div class="col-6">{$object.rooms}</div>
                        </div>
                    {/if}
                    {if $object.floor != null}
                        <div class="row">
                            <div class="col-6">{$parameters.floor}</div>
                            <div class="col-6">{$object.floor}</div>
                        </div>
                    {/if}
                    {if $object.max_floor != null}
                        <div class="row">
                            <div class="col-6">{$parameters.area_total}</div>
                            <div class="col-6">{$object.max_floor}</div>
                        </div>
                    {/if}
                    {if $object.area_total != null}
                        <div class="row">
                            <div class="col-6">{$parameters.area_total}</div>
                            <div class="col-6">{$object.area_total}</div>
                        </div>
                    {/if}
                    {if $object.area_live != null}
                        <div class="row">
                            <div class="col-6">{$parameters.area_live}</div>
                            <div class="col-6">{$object.area_live}</div>
                        </div>
                    {/if}
                    {if $object.area_kitchen != null}
                        <div class="row">
                            <div class="col-6">{$parameters.area_kitchen}</div>
                            <div class="col-6">{$object.area_kitchen}</div>
                        </div>
                    {/if}
                    {if $object.material != null}
                        <div class="row">
                            <div class="col-6">{$parameters.material}</div>
                            <div class="col-6">{$object.material}</div>
                        </div>
                    {/if}
                    {if $object.heating != null}
                        <div class="row">
                            <div class="col-6">{$parameters.heating}</div>
                            <div class="col-6">{$object.heating}</div>
                        </div>
                    {/if}
                    {if $object.sewerage != null}
                        <div class="row">
                            <div class="col-6">{$parameters.sewerage}</div>
                            <div class="col-6">{$object.sewerage}</div>
                        </div>
                    {/if}
                    {if $object.gas != null}
                        <div class="row">
                            <div class="col-6">{$parameters.gas}</div>
                            <div class="col-6">{$object.gas}</div>
                        </div>
                    {/if}
                    {if $object.water != null}
                        <div class="row">
                            <div class="col-6">{$parameters.water}</div>
                            <div class="col-6">{$object.water}</div>
                        </div>
                    {/if}
                    {if $object.distance_metro != null}
                        <div class="row">
                            <div class="col-6">{$parameters.distance_metro}</div>
                            <div class="col-6">{$object.distance_metro}</div>
                        </div>
                    {/if}
                    {if $object.distance_sea != null}
                        <div class="row">
                            <div class="col-6">{$parameters.distance_sea}</div>
                            <div class="col-6">{$object.distance_sea}</div>
                        </div>
                    {/if}
                    {if $object.children != null}
                        <div class="row">
                            <div class="col-6">{$parameters.children}</div>
                            <div class="col-6">{$object.children}</div>
                        </div>
                    {/if}
                    {if $object.animals != null}
                        <div class="row">
                            <div class="col-6">{$parameters.animals}</div>
                            <div class="col-6">{$object.animals}</div>
                        </div>
                    {/if}
                    {if $object.new_building != null}
                        <div class="row">
                            <div class="col-6">{$parameters.new_building}</div>
                            <div class="col-6">{$object.new_building}</div>
                        </div>
                    {/if}
                    {if $object.land_size != null}
                        <div class="row">
                            <div class="col-6">{$parameters.land_size}</div>
                            <div class="col-6">{$object.land_size}</div>
                        </div>
                    {/if}
                    {if $object.land_unit_price != null}
                        <div class="row">
                            <div class="col-6">{$parameters.land_unit_price}</div>
                            <div class="col-6">{$object.land_unit_price}</div>
                        </div>
                    {/if}
                    {if $object.price != null}
                        <div class="row">
                            <div class="col-6">{$parameters.price}</div>
                            <div class="col-6">{$object.price}</div>
                        </div>
                    {/if}
                </div>
                {if !empty($object.description)}
                    <div class="object-description">
                        <div class="row">
                            <div class="col-12">
                                <div class="lined">
                                    <span>{$inscriptions.object_desc}</span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">{$object.description}</div>
                        </div>
                    </div>
                {/if}
            </div>
            <div class="col-md-8">
                <div class="tabs">
                    <div class="tab">
                        <input type="radio" id="tab1" name="tab-group" checked>
                        <label for="tab1" class="tab-title">{$inscriptions.photo}</label>
                        <section class="tab-content">
                            <div class="product-images">
                                <div class="fotorama" data-nav="thumbs" data-height="400">
                                    {foreach $object.photos|json_decode as $photo}
                                        <img class="img-fluid" src="/images/objects/original/{$photo}">
                                    {/foreach}
                                </div>
                            </div>
                        </section>
                    </div>
                    {if !empty($object.map)}
                        <div class="tab">
                            <input type="radio" id="tab2" name="tab-group">
                            <label for="tab2" class="tab-title">{$inscriptions.map}</label>
                            <section class="tab-content">
                                <div class="product-map">
                                    {$object.map}
                                </div>
                            </section>
                        </div>
                    {/if}
                    {if !empty($object.panorama)}
                        <div class="tab">
                            <input type="radio" id="tab3" name="tab-group">
                            <label for="tab3" class="tab-title">{$inscriptions.panorama}</label>
                            <section class="tab-content">
                                <div class="product-map">{$object.panorama}</div>
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
            <span class="popup-title">{$inscriptions.form_title}</span>
            <form method="post">
                <div class="row">
                    <label class="col-md-6">{$inscriptions.your_name}<b style="color: red">*</b></label>
                    <input class="col-md-6" type="text" name="Request[name]">
                </div>
                <div class="row">
                    <label class="col-md-6">{$inscriptions.your_phone} <b style="color: red">*</b></label>
                    <input class="col-md-6" type="text" name="Request[phone]">
                </div>
                <div class="row">
                    <label class="col-md-6">{$inscriptions.preview_date} <b style="color: red">*</b></label>
                    <input class="col-md-6" type="text" name="Request[period]">
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <input id="acceptchk" type="checkbox" name="accept" value="on">
                        <span class="small">{$inscriptions.confirm_data}</span>
                    </div>
                </div>
                <div class="row">
                    <input class="green-btn" type="submit" value="{$inscriptions.form_btn}">
                </div>
            </form>
        </div>
    </div>

{/block}