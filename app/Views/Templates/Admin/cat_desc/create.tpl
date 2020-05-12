{extends file="template.tpl"}

{block name="content"}
    <div class="title-block">
        <h3 class="title">
            Добавление описания для категории
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
                        <label class="control-label"> Название: </label>
                        <input type="text" class="form-control boxed" name="Desc[name]">
                    </div>
                    <div class="form-group">
                        <label class="control-label"> Язык: </label>
                        <select class="c-select form-control boxed" name="Desc[lang]">
                            <option></option>
                            <option value="1">Русский</option>
                            <option value="2">Английский</option>
                            <option value="3">Грузинский</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary right">Добавить</button>
                    </div>
                </form>
            </section>
        </div>
    </div>
{/block}