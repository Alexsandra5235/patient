<#import "blocks/template.ftlh" as t>

<@t.page namePage="journal" titlePage="ЖУРНАЛ УЧЕТА ПРИЕМА ПАЦИЕНТОВ">

        <div style="height: 100vh; width: 100vw; overflow-y: auto; position: relative; padding: 0" class="container blurBG">
            <div class="container-fluid text-white">
                <h5 class="my-4">Просмотр журнала приема и выписки пациентов
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-journal-text" viewBox="0 0 16 16">
                        <path d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
                        <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"/>
                        <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"/>
                    </svg>
                </h5>
                <hr>
                <form action="/" method="get" autocomplete="off" class="d-flex">
                    <div class="input-group me-2">
                        <input class="form-control pe-xxl-5 text-left" name="full_name" id="full_name" <#if full_name??>value="${full_name}"</#if> type="text" placeholder="Поиск пациента по ФИО">
                        <a href="/" class="btn btn-danger">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                                <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
                            </svg>
                        </a>
                        <button class="btn btn-primary" type="submit">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                            </svg>
                        </button>
                    </div>
                </form>
                <hr>
                <p class="card-text">На этой странице отображается краткая информация о пациентах.
                    При необходимости просмотра полной информации нажмите на соответствующую кнопку.</p>
                <#if lastJournal??>
                    <a href="/journal/info/${lastJournal.id}" class="btn btn-primary mb-4" id="btn-show" role="button">
                        Просмотр последней добавленной записи
                        <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                            <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                            <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                        </svg>
                    </a>
                </#if>
            </div>
            <div class="table-container" style="table-layout: fixed; position: absolute">
                <table class="table">
                    <thead>
                    <tr>
                        <td onclick="filterData()" style="cursor: pointer">
                            <#--    для передачи значения сортировки таблицы в контроллер-->
                            <form action="/" method="get" id="formSort" hidden="hidden">
                                <label for="sort"></label>
                                <input type="text" name="sortData" id="sort" <#if sort??>value="${sort}"</#if>>
                            </form>
                            Дата послупления
                            <#if sort??>
                                <#if sort == "desc">
                                    <span>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-sort-down" viewBox="0 0 16 16">
                                <path d="M3.5 2.5a.5.5 0 0 0-1 0v8.793l-1.146-1.147a.5.5 0 0 0-.708.708l2 1.999.007.007a.497.497 0 0 0 .7-.006l2-2a.5.5 0 0 0-.707-.708L3.5 11.293V2.5zm3.5 1a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zM7.5 6a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5zm0 3a.5.5 0 0 0 0 1h3a.5.5 0 0 0 0-1h-3zm0 3a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1z"/>
                            </svg>
                        </span>
                                <#else>
                                    <span>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-sort-down-alt" viewBox="0 0 16 16">
                                <path d="M3.5 3.5a.5.5 0 0 0-1 0v8.793l-1.146-1.147a.5.5 0 0 0-.708.708l2 1.999.007.007a.497.497 0 0 0 .7-.006l2-2a.5.5 0 0 0-.707-.708L3.5 12.293V3.5zm4 .5a.5.5 0 0 1 0-1h1a.5.5 0 0 1 0 1h-1zm0 3a.5.5 0 0 1 0-1h3a.5.5 0 0 1 0 1h-3zm0 3a.5.5 0 0 1 0-1h5a.5.5 0 0 1 0 1h-5zM7 12.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7a.5.5 0 0 0-.5.5z"/>
                            </svg>
                        </span>
                                </#if>
                            </#if>
                        </td>
                        <td>Время послупления</td>
                        <td>Фамилия, имя, отчестов (при наличии)</td>
                        <td>Дата рождения (число, месяц, год)</td>
                        <td>Номер медицинской карты</td>
                        <td>Исход госпитализации, дата и время исхода, наименование медицинской организации, куда переведен пациент</td>
                        <td>Просмотр полной информации</td>
                    </tr>
                    </thead>
                    <tbody>
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
                    </tbody>
                </table>
            </div>
        </div>



<#--    <div class="container-fluid my-4">-->
<#--        <div class="card">-->

<#--            <div class="card-body">-->
<#--                <h5 class="h4 my-4">Просмотр журнала приема и выписки пациентов</h5>-->
<#--                <p class="card-text">На этой странице отображается краткая информация о пациентах.-->
<#--                    При необходимости просмотра полной информации нажмите на соответствующую кнопку.</p>-->
<#--                <a href="/journal/info/${lastJournal.id}" class="btn btn-primary" id="btn-show" role="button">-->
<#--                    Просмотр последней добавленной записи-->
<#--                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">-->
<#--                        <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>-->
<#--                        <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>-->
<#--                    </svg>-->
<#--                </a>-->
<#--                <h5 class="card-title mb-2">Краткая информация о поступивших пациентах</h5>-->
<#--                <div class="card-text table-container" style="table-layout: fixed">-->
<#--                    <table class="table">-->
<#--                        <thead>-->
<#--                            <tr>-->
<#--                                <td onclick="filterData()" style="cursor: pointer">-->
<#--                                    Дата послупления-->
<#--                                    <#if sort??>-->
<#--                                        <#if sort == "desc">-->
<#--                                            <span>-->
<#--                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-sort-down" viewBox="0 0 16 16">-->
<#--                                                    <path d="M3.5 2.5a.5.5 0 0 0-1 0v8.793l-1.146-1.147a.5.5 0 0 0-.708.708l2 1.999.007.007a.497.497 0 0 0 .7-.006l2-2a.5.5 0 0 0-.707-.708L3.5 11.293V2.5zm3.5 1a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zM7.5 6a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5zm0 3a.5.5 0 0 0 0 1h3a.5.5 0 0 0 0-1h-3zm0 3a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1z"/>-->
<#--                                                </svg>-->
<#--                                            </span>-->
<#--                                        <#else>-->
<#--                                            <span>-->
<#--                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-sort-down-alt" viewBox="0 0 16 16">-->
<#--                                                    <path d="M3.5 3.5a.5.5 0 0 0-1 0v8.793l-1.146-1.147a.5.5 0 0 0-.708.708l2 1.999.007.007a.497.497 0 0 0 .7-.006l2-2a.5.5 0 0 0-.707-.708L3.5 12.293V3.5zm4 .5a.5.5 0 0 1 0-1h1a.5.5 0 0 1 0 1h-1zm0 3a.5.5 0 0 1 0-1h3a.5.5 0 0 1 0 1h-3zm0 3a.5.5 0 0 1 0-1h5a.5.5 0 0 1 0 1h-5zM7 12.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7a.5.5 0 0 0-.5.5z"/>-->
<#--                                                </svg>-->
<#--                                            </span>-->
<#--                                        </#if>-->
<#--                                    </#if>-->
<#--                                </td>-->
<#--                                <td>Время послупления</td>-->
<#--                                <td>Фамилия, имя, отчестов (при наличии)</td>-->
<#--                                <td>Дата рождения (число, месяц, год)</td>-->
<#--                                <td>Номер медицинской карты</td>-->
<#--                                <td>Исход госпитализации, дата и время исхода, наименование медицинской организации, куда переведен пациент</td>-->
<#--                                <td>Просмотр полной информации</td>-->
<#--                            </tr>-->
<#--                        </thead>-->
<#--                        <tbody>-->
<#--                           <#list journals as journal>-->
<#--                               <tr>-->
<#--                                   <td><#if journal.normal_date??> ${journal.normal_date} </#if></td>-->
<#--                                   <td><#if journal.string_time_receipt??> ${journal.string_time_receipt} </#if></td>-->
<#--                                   <td><#if journal.full_name??> ${journal.full_name} </#if></td>-->
<#--                                   <td><#if journal.birth_day??> ${journal.normal_birth_day} </#if></td>-->
<#--                                   <td><#if journal.medical_card??> ${journal.medical_card} </#if></td>-->
<#--                                   <td>-->
<#--                                       <#if journal.outcome_hospitalization != "">Пациент ${journal.outcome_hospitalization} </#if><br>-->
<#--                                       <#if journal.date_time_discharge != "">Дата и время исхода: ${journal.date_time_discharge} </#if><br>-->
<#--                                       <#if journal.medical_organization_transferred != "">Переведен: ${journal.medical_organization_transferred} </#if><br>-->
<#--                                   </td>-->
<#--                                   <td>-->
<#--                                       <a href="/journal/info/${journal.id}" class="btn btn-primary" id="btn-show" role="button">-->
<#--                                           Просмотр-->
<#--                                           <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">-->
<#--                                               <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>-->
<#--                                               <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>-->
<#--                                           </svg>-->
<#--                                       </a>-->
<#--                                   </td>-->
<#--                               </tr>-->
<#--                           <#else>-->
<#--                               <h3>Данные не найдены</h3>-->
<#--                           </#list>-->
<#--                        </tbody>-->
<#--                    </table>-->
<#--                </div>-->
<#--            </div>-->
<#--        </div>-->
<#--    </div>-->



</@t.page>

