<#import "blocks/template.ftlh" as t>

<@t.page>
    <div class="container-fluid my-4" id="card-day" >
        <div class="card" style="width: 35rem;">
            <div class="card-header">
                Ежедневный отчет
            </div>
            <div class="card-body">
                <form method="get" action="/export/excel">
                    <h5 class="card-title">Выбор диапазона дат</h5>
                    <p class="card-text">Пожалуйста, введите необходимый диапазон дат для формирования ежедневного отчета, после нажмите на соответствующую кнопку.</p>
                    <p class="card-text">Отчет будет предоставлен в формате Excel.</p>

                    <div class="input-group mb-4">
                        <span class="input-group-text">От / До</span>
                        <input class="form-control" type="date" name="data1" id="data1" oninput="onCopyInput()" max="2999-12-31">
                        <input class="form-control" type="date" name="data2" id="data2" max="2999-12-31">
                    </div>

                    <button class="btn btn-primary mb-4" type="submit">Сформировать отчет</button>
                </form>
            </div>
        </div>
    </div>

</@t.page>
