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
                        <label class="col-sm-2 form-control-label text-xs-right"> Агент: </label>
                        <div class="col-sm-10 select-block">
                            <input type="text" class="form-control boxed select-field">
                            <div class="results_container">
                                <ul class="result_list"></ul>
                            </div>
                            <input type="hidden" name="Review[user]">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> ФИО Клиента: </label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Review[name]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Текст отзыва: </label>
                        <div class="col-sm-10">
                            <textarea class="form-control boxed" rows="10" cols="30" name="Review[content]"></textarea>
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