<#import "blocks/template.ftlh" as t>

<@t.page>
    <div class="container-fluid" id="table-div">
        <label class="form-label" for="table-div">Краткая информация о поступивших пациентах</label>
        <table class="table table-bordered">
            <tr>
                <th>Дата послупления</th>
                <th>Время послупления</th>
                <th>Фамилия, имя, отчестов (при наличии)</th>
                <th>Дата рождения (число, месяц, год)</th>
                <th>Номер медицинской карты</th>
                <th>Исход госпитализации, дата и время исхода, наименование медицинской организации, куда переведен пациент</th>
                <th>Просмотр полной информации</th>
            </tr>

            <#list journals as journal>
                <tr>
                    <td><#if journal.normal_date??> ${journal.normal_date} </#if></td>
                    <td><#if journal.string_time_receipt??> ${journal.string_time_receipt} </#if></td>
                    <td><#if journal.full_name??> ${journal.full_name} </#if></td>
                    <td><#if journal.birth_day??> ${journal.normal_birth_day} </#if></td>
                    <td><#if journal.medical_card??> ${journal.medical_card} </#if></td>
                    <td>
                        <#if journal.outcome_hospitalization??>Пациент ${journal.outcome_hospitalization} </#if><br>
                        <#if journal.date_time_discharge??>Дата и время исхода: ${journal.date_time_discharge} </#if><br>
                        <#if journal.medical_organization_transferred??>Переведен: ${journal.medical_organization_transferred} </#if><br>
                    </td>
                    <td>
                        <a href="/journal/info/${journal.id}" class="btn btn-primary" id="btn-show" role="button">Просмотр</a>
                    </td>
                </tr>
            <#else>
                <h3>Данные не найдены</h3>
            </#list>
        </table>
    </div>

    <a href="/journal/save">Добавить запись</a>
    <br><br>



    <form method="get" action="/export/excel">
        <label>С <input type="date" name="data1" id="data1" oninput="onCopyInput()" max="2999-12-31"></label>
        <label>До <input type="date" name="data2" id="data2"></label>

        <label>С <input type="date" name="data11" id="data11" oninput="onCopyInput1()" max="2999-12-31"></label>
        <label>До <input type="date" name="data22" id="data22"></label>

        <button type="submit">Экспортировать в Excel</button>
    </form>
    <br><br>

    <a href="/journal/report/get">Посмотреть историю отчетов</a>
</@t.page>

