<#import "blocks/template.ftlh" as t>

<@t.page "journal">
<#--    <div class="container-fluid my-4">-->
<#--        <div class="card">-->
<#--            <div class="card-body">-->
<#--                <h5 class="card-title">Просмотр журнала приема и выписки пациентов</h5>-->
<#--                <p class="card-text">На этой странице отображается краткая информация о пациентах.-->
<#--                    При необходимости просмотра полной информации нажмите на соответствующую кнопку.</p>-->
<#--            </div>-->
<#--        </div>-->
<#--    </div>-->

    <div class="container-fluid">
        <h5 class="h4 my-4">Просмотр журнала приема и выписки пациентов</h5>
        <p class="card-text">На этой странице отображается краткая информация о пациентах.
            При необходимости просмотра полной информации нажмите на соответствующую кнопку.</p>

        <hr>
    </div>


    <div class="container-fluid my-4" id="table-div">
        <div class="card">
            <div class="card-body">
                <label class="card-title h6" for="table-div">Краткая информация о поступивших пациентах</label>
                <div class="card-text">
                    <table class="table table-bordered" id="table-info">
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
                                    <#if journal.outcome_hospitalization != "">Пациент ${journal.outcome_hospitalization} </#if><br>
                                    <#if journal.date_time_discharge != "">Дата и время исхода: ${journal.date_time_discharge} </#if><br>
                                    <#if journal.medical_organization_transferred != "">Переведен: ${journal.medical_organization_transferred} </#if><br>
                                </td>
                                <td>
                                    <a href="/journal/info/${journal.id}" class="btn btn-primary" id="btn-show" role="button">
                                        Просмотр
                                        <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                                            <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                            <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                                        </svg>
                                    </a>
                                </td>
                            </tr>
                        <#else>
                            <h3>Данные не найдены</h3>
                        </#list>
                    </table>
                </div>
            </div>
        </div>
    </div>

</@t.page>

