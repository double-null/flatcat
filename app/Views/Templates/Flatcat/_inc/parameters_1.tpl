{if $object.rooms != null}
    <div class="row">
        <div class="col-6">Комнат</div>
        <div class="col-6">{$object.rooms}</div>
    </div>
{/if}
{if $object.floor != null}
    <div class="row">
        <div class="col-6">Этаж</div>
        <div class="col-6">{$object.floor}</div>
    </div>
{/if}
{if $object.max_floor != null}
    <div class="row">
        <div class="col-6">Этажей</div>
        <div class="col-6">{$object.max_floor}</div>
    </div>
{/if}
{if $object.area_total != null}
    <div class="row">
        <div class="col-6">Общая площадь</div>
        <div class="col-6">{$object.area_total} м²</div>
    </div>
{/if}
{if $object.area_live != null}
    <div class="row">
        <div class="col-6">Жилая площадь</div>
        <div class="col-6">{$object.area_live} м²</div>
    </div>
{/if}
{if $object.area_kitchen != null}
    <div class="row">
        <div class="col-6">Площадь кухни</div>
        <div class="col-6">{$object.area_kitchen} м²</div>
    </div>
{/if}
{if $object.area_kitchen != null}
    <div class="row">
        <div class="col-6">Материал</div>
        <div class="col-6">{$object.material}</div>
    </div>
{/if}
{if $object.heating != null}
    <div class="row">
        <div class="col-6">Отопление</div>
        <div class="col-6">{$object.material}</div>
    </div>
{/if}
{if $object.water != null}
    <div class="row">
        <div class="col-6">Минут до моря</div>
        <div class="col-6">{$object.water}</div>
    </div>
{/if}
{if $object.metro != null}
    <div class="row">
        <div class="col-6">Минут до метро</div>
        <div class="col-6">{$object.metro}</div>
    </div>
{/if}
{if $object.children != null}
    <div class="row">
        <div class="col-6">Можно с детьми</div>
        <div class="col-6">{$object.children}</div>
    </div>
{/if}
{if $object.animals != null}
    <div class="row">
        <div class="col-6">Можно с животными</div>
        <div class="col-6">{$object.animals}</div>
    </div>
{/if}