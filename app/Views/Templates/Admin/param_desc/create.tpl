{extends file="template.tpl"}

{block name="content"}
    <div class="title-block">
        <h3 class="title">
            Добавление описаний параметра {$param_mark}
            <span data-type="bar" class="sparkline bar"></span>
        </h3>
    </div>

    <div class="card">
        <div class="card-block">
            <section>
                <form method="post">
                    {if !empty($success)}<span style="color: #4BCF99;">{$success}</span>{/if}
                    {if !empty($error)}<span style="color: #FF4444;">{$error}</span>{/if}
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right">Название:</label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Param[name]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right">Единица измерения:</label>
                        <div class="col-sm-10"><input type="text" class="form-control boxed" name="Param[unit]"></div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 form-control-label text-xs-right"> Язык: </label>
                        <div class="col-sm-10">
                            <select class="c-select form-control boxed" name="Param[lang]">
                                <option></option>
                                <option value="1">Русский</option>
                                <option value="2">Английский</option>
                                <option value="3">Грузинский</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary right">Добавить</button>
                    </div>
                </form>
            </section>
        </div>
    </div>
{/block}