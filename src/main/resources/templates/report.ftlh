<#import "blocks/template.ftlh" as t>

<@t.page namePage="report" titlePage="ИСТОРИЯ ОТЧЕТОВ">

    <div class="alert-primary" id="scrollToTop">
        <a href="#" style="text-decoration: none">
            <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-arrow-up-circle" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
            </svg>
        </a>
    </div>

    <form action="/journal/report/get" method="get">

        <div class="container-fluid my-4">
            <div class="card">
                <div class="card-body">
                    <label class="card-title h5" for="search_date">Поиск отчета по дате создания</label>
                    <p class="card-text">Введите пожалуйста дату, начиная с которой будет выполнен поиск</p>
                    <div class="input-group my-4">
                        <input class="form-control" name="search_date" id="search_date" type="date" <#if search_date??>value="${search_date}"</#if>>
                        <div class="input-group-append">
                            <a href="/journal/report/get" class="btn btn-outline-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                                    <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
                                </svg>
                            </a>
                        </div>
                    </div>
                    <input class="btn btn-outline-primary" type="submit" value="Поиск">
                </div>
            </div>
        </div>
    </form>

<#--    <div class="container-fluid mb-4">-->
<#--        <div class="card">-->
<#--            <div class="card-body">-->
<#--                <h5 class="card-title">Просмотр истории отчетов</h5>-->
<#--                <p class="card-text">На этой странице отображаются ранее сформированные отчеты, при необходимости их можно скачать, нажав на соответствующую кнопку</p>-->
<#--            </div>-->
<#--        </div>-->
<#--    </div>-->

    <div class="container-fluid my-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title mb-2">Просмотр истории отчетов</h5>
                <p class="card-text">В этой таблице отображаются ранее сформированные отчеты, при необходимости их можно скачать, нажав на соответствующую кнопку</p>
                <div class="card-text table-container" style="table-layout: fixed; width: 100%;">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Дата создания</th>
                                <th>Время создания</th>
                                <th>Название файла</th>
                                <th>Скачать</th>
                            </tr>
                        </thead>
                        <tbody>
                        <#list reports as report>
                            <tr>
                                <td>${report.createdDate}</td>
                                <td>${report.createdTime}</td>
                                <td>${report.fileName}</td>
                                <td><a class="btn btn-primary" href="/journal/report/get/${report.id}">Скачать</a> </td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>




                </div>
            </div>
        </div>
    </div>


<#--    <#list dates as data>-->
<#--        <div class="card mb-4 mx-xxl-5">-->
<#--            <div class="card-body">-->
<#--                <h5 class="card-title">Дата создания: ${data}</h5>-->
<#--                <hr>-->
<#--                <div class="card-height">-->
<#--                    <#list times as time>-->
<#--                        <#list reports as report>-->
<#--                            <#if report.createdDate == data && report.createdTime == time>-->
<#--                                <h6 class="card-subtitle mb-2 text-body-secondary">Время создания: ${time}</h6>-->
<#--                                <p class="card-text"> Имя файла: ${report.fileName}</p>-->
<#--                                <a class="btn btn-outline-primary" href="/journal/report/get/${report.id}">Скачать ${report.fileName}</a>-->
<#--                                <hr>-->
<#--                            </#if>-->
<#--                        </#list>-->
<#--                    </#list>-->
<#--                </div>-->
<#--            </div>-->
<#--        </div>-->
<#--    <#else>-->
<#--        <p>Данные не найдены</p>-->
<#--    </#list>-->
</@t.page>
