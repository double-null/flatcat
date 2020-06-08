{extends file="template.tpl"}

{block name="content"}
    <div class="title-block">
        <h3 class="title">
            Добавление кода (карты и панорамы)
            <span data-type="bar" class="sparkline bar"></span>
        </h3>
    </div>

    <div class="card">
        <div class="card-block">
            <section class="col col-md-9">
                <form method="post">
                    {if !empty($success)}<span style="color: #4BCF99;">Описание добавлено</span>{/if}
                    {if !empty($error)}<span style="color: #FF4444;">{$error}</span>{/if}
                    <div class="form-group">
                        <label class="control-label"> Карта: </label>
                        <textarea class="form-control boxed" name="Code[map]" id="" cols="30" rows="10"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="control-label"> Панорама: </label>
                        <textarea class="form-control boxed" name="Code[panorama]" id="" cols="30" rows="10"></textarea>
                    </div>
                    <input type="hidden" name="Code[product]" value="{$productID}">
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary right">Добавить</button>
                    </div>
                </form>
            </section>
        </div>
    </div>
{/block}