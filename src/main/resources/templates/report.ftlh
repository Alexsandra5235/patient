<#import "blocks/template.ftlh" as t>

<@t.page namePage="report" titlePage="ИСТОРИЯ ОТЧЕТОВ">

    <div class="alert-primary" id="scrollToTop">
        <a href="#" style="text-decoration: none">
            <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-arrow-up-circle" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
            </svg>
        </a>
    </div>

    <p style="justify-content: center; display: flex; margin-bottom: 0">
        <a style="margin-top: -13px; padding-top: 0; color: #212529" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
            </svg>
        </a>
    </p>
    <div class="container-fluid mb-3">
        <div class="collapse" id="collapseExample">
            <div class="card card-body">
                <label class="card-title h5" for="search_date">Поиск отчета по выбранному параметру</label>
                <select class="form-select" name="selectSearch" id="selectSearch" aria-label="Выбирите параметр" onchange="checkSelectSearchReport()">
                    <option <#if valueSelect?? && valueSelect == "0">selected</#if> value="0">Выбирите параметр...</option>
                    <option <#if valueSelect?? && valueSelect == "1">selected</#if> value="1">Посик по дате создания отчета</option>
                    <option value="2">Поиск по типу отчета</option>
                    <option value="3">Поиск по начальной и конченой дате создания отчета</option>
                </select>
                <hr>
                <p class="card-text" id="titleSearch" <#if valueSelect == 'null'>style="display: none"</#if>>Введите пожалуйста дату создания отчета</p>
                <form action="/journal/report/get" method="get" id="containerSearch" <#if valueSelect == 'null'>style="display: none"</#if>>
                    <input name="valueSelect" id="valueSelect" style="display: none" <#if valueSelect??>value="${valueSelect}"</#if>>
                    <div class="input-group mb-2">
                        <input class="form-control" name="search_date" id="search_date" type="date" <#if search_date??>value="${search_date}"</#if>>
                        <div class="input-group-append">
                            <a href="/journal/report/get" class="btn btn-danger">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                                    <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
                                </svg>
                            </a>
                        </div>
                    </div>
                    <input class="btn btn-primary" type="submit" value="Поиск">
                </form>
            </div>
        </div>
    </div>



    <div class="container-fluid" style="justify-content: center; display: flex">
        <div class="card" style="width: 50%; min-width: 500px">
            <div class="card-body">
                <label class="card-title h5 my-3" for="search_date">Просмотр истории создания отчетов</label>
                <hr>
                <div class="card-text">
                    <div class="accordion" id="accordionExample">
                        <#list dates as data>
                            <div class="accordion-item">
                                <h5 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#${data}" aria-expanded="false" aria-controls="collapseOne">
                                        Дата создания отчета: ${data}
                                    </button>
                                </h5>
                                <div id="${data}" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                    <#assign stopLoop = "">
                                    <#list times as time>
                                        <#list reports as report>

                                            <#if report.createdDate == data && report.createdTime == time>
                                                <#if stopLoop != time>
                                                    <div class="accordion-body py-2">
                                                        <strong>Время создания отчета: ${time}</strong>
                                                    </div>
                                                    <div class="accordion-body mx-5 py-2">
                                                        <#if report.typeReport??>Тип отчета: ${report.typeReport}<br></#if>
                                                        Конечная и начальная даты отчетного периода:
                                                        <div class="dropdown">
                                                            <a class="btn btn-primary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                                                                ${report.fileName}
                                                            </a>
                                                            <ul class="dropdown-menu">
                                                                <li> <a class="dropdown-item" href="/journal/report/get/${report.id}">Скачать отчет</a></li>
                                                                <li><button class="dropdown-item" onclick="viewReport(${report.id})">Посмотреть отчет</button></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                <#else>
                                                    <div class="accordion-body mx-5 py-2">
                                                        <#if report.typeReport??>Тип отчета: ${report.typeReport}<br></#if>
                                                        Конечная и начальная даты отчетного периода:
                                                        <div class="dropdown">
                                                            <a class="btn btn-primary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                                                                ${report.fileName}
                                                            </a>
                                                            <ul class="dropdown-menu">
                                                                <li> <a class="dropdown-item" href="/journal/report/get/${report.id}">Скачать отчет</a></li>
                                                                <li><button class="dropdown-item" onclick="viewReport(${report.id})">Посмотреть отчет</button></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </#if>
                                                <#assign stopLoop = time>
                                            </#if>
                                        </#list>
                                    </#list>

                                </div>
                            </div>
                        </#list>
                    </div>
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

    <input name="changeSelect" id="changeSelect" hidden="hidden">
</@t.page>
