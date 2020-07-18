{if $object.max_floor != null}
    <div class="row">
        <div class="col-6">Этажей всего:</div>
        <div class="col-6">{$object.max_floor}</div>
    </div>
{/if}
{if $object.area_total != null}
    <div class="row">
        <div class="col-6">Общая площадь:</div>
        <div class="col-6">{$object.area_total}</div>
    </div>
{/if}
{if $object.material != null}
    <div class="row">
        <div class="col-6">Материал:</div>
        <div class="col-6">{$object.material}</div>
    </div>
{/if}
{if $object.heating != null}
    <div class="row">
        <div class="col-6">Отопление:</div>
        <div class="col-6">{$object.heating}</div>
    </div>
{/if}
{if $object.year != null}
    <div class="row">
        <div class="col-6">Год:</div>
        <div class="col-6">{$object.year}</div>
    </div>
{/if}