<#import "blocks/template.ftlh" as t>

<@t.page namePage="report" titlePage="ИСТОРИЯ ФОРМИРОВАНИЯ ОТЧЕТОВ">

<#--    <div class="alert-primary" id="scrollToTop">-->
<#--        <a href="#" style="text-decoration: none">-->
<#--            <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-arrow-up-circle" viewBox="0 0 16 16">-->
<#--                <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>-->
<#--            </svg>-->
<#--        </a>-->
<#--    </div>-->
<div class="container" style="height: 100vh; width: 100vw; overflow-y: auto; position: relative; ">

    <div class="container" style="justify-content: center; width: 50vw; border-radius: 7px">

        <p style="justify-content: center; display: flex; margin-bottom: 0">
            <a style="margin-top: -13px; padding-top: 0; color: #212529" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                    <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                </svg>
            </a>
        </p>
        <div class="container-fluid mb-3">
            <div class="collapse" id="collapseExample">
                <div class="card card-body bg-dark text-white">
                    <label class="card-title h5" for="search_date">Поиск отчета по выбранному параметру</label>
                    <select class="form-select" name="selectSearch" id="selectSearch" aria-label="Выбирите параметр" onchange="checkSelectSearchReport()">
                        <option <#if valueSelect?? && valueSelect == "0">selected</#if> style="font-weight: bold" value="0">Выбирите параметр...</option>
                        <option <#if valueSelect?? && valueSelect == "1">selected</#if> value="1">Посик по дате создания отчета</option>
                        <option value="2">Поиск по типу отчета</option>
                        <option <#if valueSelect?? && valueSelect == "3">selected</#if> value="3">Поиск по отчетному периоду</option>
                    </select>
                    <hr>

                    <form action="/log/report/get" method="get" id="containerSearch" <#if valueSelect == 'null' || valueSelect != "1">style="display: none"</#if>>
                        <p class="card-text" id="titleSearch">Введите пожалуйста дату создания отчета</p>
                        <input name="valueSelect" id="valueSelect" style="display: none" <#if valueSelect??>value="${valueSelect}"</#if>>
                        <div class="input-group mb-2">
                            <input class="form-control" name="search_date" id="search_date" type="date" <#if search_date??>value="${search_date}"</#if>>
                            <div class="input-group-append">
                                <a href="/log/report/get" class="btn btn-danger">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                                        <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
                                    </svg>
                                </a>
                            </div>
                        </div>
                        <input class="btn btn-primary" type="submit" value="Поиск">
                    </form>

                    <form action="/log/report/get" method="get" id="containerSearch3" <#if valueSelect == 'null' || valueSelect != "3">style="display: none"</#if>>
                        <p class="card-text" id="titleSearch3">Введите пожалуйста отчетный период</p>
                        <input name="valueSelect" id="valueSelect3" style="display: none" <#if valueSelect??>value="${valueSelect}"</#if>>
                        <div class="input-group mb-2">
                            <span class="input-group-text">От / До</span>
                            <input class="form-control" type="date" name="start_data" id="data1" max="2999-12-31" <#if start_data??> value="${start_data}" </#if>>
                            <input class="form-control" type="date" name="end_data" id="data2" max="2999-12-31" <#if end_data??> value="${end_data}" </#if>>
                            <div class="input-group-append">
                                <a href="/log/report/get" class="btn btn-danger">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                                        <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
                                    </svg>
                                </a>
                            </div>
                        </div>
                        <input class="btn btn-primary" type="submit" value="Поиск">
                    </form>

                    <form action="/log/report/get" method="get" id="containerSearch2" <#if valueSelect == 'null' || valueSelect != "2">style="display: none"</#if>>
                        <p class="card-text" id="titleSearch2">Выбирите подходящий тип отчета для поиска</p>
                        <input name="valueSelect" id="valueSelect2" style="display: none" <#if valueSelect??>value="${valueSelect}"</#if>>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="day" checked>
                                Лист ежедневного учета
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="mounth">
                                Сводная ведомость учета
                            </label>
                        </div>
                        <input class="btn btn-primary" type="submit" value="Поиск">
                        <a href="/log/report/get" class="btn btn-danger">
                            Отчистить поиск
                        </a>
                    </form>
                </div>
            </div>
        </div>
    </div>



    <div class="container-fluid" style="justify-content: center; display: flex">
        <div class="card" style="width: 50%; min-width: 500px">
            <div class="card-body">
                <label class="card-title h5 my-3" for="search_date">
                    Просмотр истории создания отчетов
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-clock-history" viewBox="0 0 16 16">
                        <path d="M8.515 1.019A7 7 0 0 0 8 1V0a8 8 0 0 1 .589.022l-.074.997zm2.004.45a7.003 7.003 0 0 0-.985-.299l.219-.976c.383.086.76.2 1.126.342l-.36.933zm1.37.71a7.01 7.01 0 0 0-.439-.27l.493-.87a8.025 8.025 0 0 1 .979.654l-.615.789a6.996 6.996 0 0 0-.418-.302zm1.834 1.79a6.99 6.99 0 0 0-.653-.796l.724-.69c.27.285.52.59.747.91l-.818.576zm.744 1.352a7.08 7.08 0 0 0-.214-.468l.893-.45a7.976 7.976 0 0 1 .45 1.088l-.95.313a7.023 7.023 0 0 0-.179-.483zm.53 2.507a6.991 6.991 0 0 0-.1-1.025l.985-.17c.067.386.106.778.116 1.17l-1 .025zm-.131 1.538c.033-.17.06-.339.081-.51l.993.123a7.957 7.957 0 0 1-.23 1.155l-.964-.267c.046-.165.086-.332.12-.501zm-.952 2.379c.184-.29.346-.594.486-.908l.914.405c-.16.36-.345.706-.555 1.038l-.845-.535zm-.964 1.205c.122-.122.239-.248.35-.378l.758.653a8.073 8.073 0 0 1-.401.432l-.707-.707z"/>
                        <path d="M8 1a7 7 0 1 0 4.95 11.95l.707.707A8.001 8.001 0 1 1 8 0v1z"/>
                        <path d="M7.5 3a.5.5 0 0 1 .5.5v5.21l3.248 1.856a.5.5 0 0 1-.496.868l-3.5-2A.5.5 0 0 1 7 9V3.5a.5.5 0 0 1 .5-.5z"/>
                    </svg>
                </label>
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
                                                        Начальная и конечная даты отчетного периода:
                                                        <div class="dropdown">
                                                            <a class="btn btn-primary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                                                                ${report.fileName}
                                                            </a>
                                                            <ul class="dropdown-menu">
                                                                <li> <a class="dropdown-item" href="/log/report/get/${report.id}">Скачать отчет</a></li>
                                                                <li><button class="dropdown-item" onclick="viewReport(${report.id})">Посмотреть отчет</button></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                <#else>
                                                    <div class="accordion-body mx-5 py-2">
                                                        <#if report.typeReport??>Тип отчета: ${report.typeReport}<br></#if>
                                                        Начальная и конечная даты отчетного периода:
                                                        <div class="dropdown">
                                                            <a class="btn btn-primary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                                                                ${report.fileName}
                                                            </a>
                                                            <ul class="dropdown-menu">
                                                                <li> <a class="dropdown-item" href="/log/report/get/${report.id}">Скачать отчет</a></li>
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
</div>
    <input name="changeSelect" id="changeSelect" hidden="hidden">
</@t.page>
