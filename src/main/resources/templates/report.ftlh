<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JOURNAL</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        .container-fluid {
            padding-bottom: 10px;
            margin-bottom: 10px;
        }
    </style>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
    <body>

    <h3 align="center">ЖУРНАЛ УЧЕТА ПРИЕМА ПАЦИЕНТОВ И ОТКАЗОВ В ОКАЗАНИИ МЕДИЦИНСКОЙ ПОМОЩИ<br>
        В СТАЦИОНАРНЫХ УСЛОВИЯХ, В УСЛОВИЯХ ДНЕВНОГО СТАЦИОНАРА</h3>

    <form action="/journal/report/get" method="get">
        <div class="container-fluid">
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

    <div class="container-fluid">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Просмотр истории отчетов</h5>
                <p class="card-text">На этой странице отображаются ранее сформированные отчеты, при необходимости их можно скачать, нажав на соответствующую кнопку</p>
            </div>
        </div>
    </div>

    <#list dates as data>
        <div class="container-fluid">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Дата создания: ${data}</h5>
                    <hr>
                    <#list times as time>
                        <#list reports as report>
                            <#if report.createdDate == data && report.createdTime == time>
                                <h6 class="card-subtitle mb-2 text-body-secondary">Время создания: ${time}</h6>
                                <p class="card-text"> Имя файла: ${report.fileName}</p>
                                <a class="btn btn-outline-primary" href="/journal/report/get/${report.id}">Скачать ${report.fileName}</a>
                                <hr>
                            </#if>
                        </#list>
                    </#list>
                </div>
            </div>
        </div>
    <#else>
        <p>Данные не найдены</p>
    </#list>


<#--    <#list dates as data>-->
<#--        <p>${data}</p>-->
<#--        <#list times as time>-->
<#--            <p>${time}</p>-->
<#--            <#list reports as report>-->
<#--                <#if report.createdAt.toLocalDate() == data && report.createdAt.toLocalTime() == time>-->
<#--                    <a href="/journal/report/get/${report.id}">${report.fileName}</a>-->
<#--                </#if>-->

<#--            </#list>-->
<#--        </#list>-->
<#--    </#list>-->
<#--    <br>-->

<#--    <#list reports as report>-->
<#--        <p>${report.createdAt}</p>-->
<#--        <a href="/journal/report/get/${report.id}">${report.fileName}</a>-->
<#--    </#list>-->
    </body>
</html>