{extends file="template.tpl"}

{block name="content"}
    <div class="title-block">
        <h3 class="title">
            Добавить отзыв
            <span data-type="bar" class="sparkline bar"></span>
        </h3>
    </div>
    <div class="card">
        <div class="card-block">
            <section>
                <form method="post" enctype="multipart/form-data">
                    {if !empty($error)}<span style="color: #FF4444;">{$error}</span>{/if}
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Метка(EN): </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Review[mark]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Агент: </label>
                        <div class="col-sm-10">
                            <select class="c-select form-control boxed" name="Review[user]">
                                <option></option>
                                {foreach $agents as $agent}
                                    <option value="{$agent.id}">{$agent.name}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Фото отзыва: </label>
                        <div class="col-sm-10"><input type="file" name="photo1" class="boxed"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Фото с клиентом: </label>
                        <div class="col-sm-10"><input type="file" name="photo2" class="boxed"></div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary right">Добавить</button>
                    </div>
                </form>
            </section>
        </div>
    </div>
{/block}