<#import "blocks/template.ftlh" as t>

<@t.page titlePage="ЕЖЕМЕСЯЧНЫЙ ОТЧЕТ">
    <div class="container-fluid my-4" id="card-day" >
        <div class="card" style="width: 35rem;">
            <div class="card-header">
                Ежемесячный отчет
            </div>
            <div class="card-body">
                <form method="get" action="/export/excel">
                    <h5 class="card-title">Выбор диапазона дат</h5>
                    <p class="card-text">Пожалуйста, введите необходимый диапазон дат для формирования ежемесячного отчета, после нажмите на соответствующую кнопку.</p>
                    <p class="card-text">Отчет будет предоставлен в формате Excel.</p>

                    <div class="input-group mb-4">
                        <span class="input-group-text">От / До</span>
                        <input class="form-control" type="date" name="data11" id="data11" oninput="onCopyInput1()" max="2999-12-31">
                        <input class="form-control" type="date" name="data22" id="data22" max="2999-12-31">
                    </div>

                    <button class="btn btn-primary mb-4" type="submit">Сформировать отчет</button>
                </form>
            </div>
        </div>
    </div>

</@t.page>
