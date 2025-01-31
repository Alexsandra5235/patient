<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ЖУРНАЛ УЧЕТА ПРИЕМА ПАЦИЕНТОВ</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        #table-div {
            max-height: 400px;
            overflow-y: auto;
        }

        .container-fluid {
            padding-bottom: 30px;
        }

        #btn-show {
            width: 100%;
            display: block;
            box-sizing: border-box;
        }

    </style>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>


<#--<nav class="navbar navbar-dark bg-dark">-->
<#--    <div class="container-fluid" style="padding-bottom: 0">-->
<#--        <a href="/">-->
<#--            <span class="navbar-brand mb-0 h1">BUYSELL</span>-->
<#--        </a>-->
<#--        <button class="btn btn-light my-2 my-sm-0" type="button"-->
<#--                onclick="window.location.href = '/login'">-->
<#--            Войти-->
<#--        </button>-->
<#--    </div>-->
<#--</nav>-->

<nav class="navbar navbar-expand-lg navbar-dark bg-dark py-3">
    <div class="container-fluid" style="padding-bottom: 0">
        <a class="navbar-brand px-xxl-5" href="/">
            <div class="input-group align-content-center">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-journals" viewBox="0 0 16 16">
                    <path d="M5 0h8a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2 2 2 0 0 1-2 2H3a2 2 0 0 1-2-2h1a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1H1a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v9a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H5a1 1 0 0 0-1 1H3a2 2 0 0 1 2-2"/>
                    <path d="M1 6v-.5a.5.5 0 0 1 1 0V6h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0V9h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 2.5v.5H.5a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1H2v-.5a.5.5 0 0 0-1 0"/>
                </svg>
                <span class="px-2">JOURNAL</span>
            </div>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Переключатель навигации">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item me-3">
                    <a class="nav-link active" aria-current="page" href="/">Главная</a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link" href="/journal/save">Добавить запись</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Формирование отчетов
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Ежедневный отчет</a></li>
                        <li><a class="dropdown-item" href="#">Ежемесячный отчет</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="/journal/report/get">История формирования отчетов</a></li>
                    </ul>
                </li>
            </ul>
            <form action="/" method="get" autocomplete="off" class="d-flex">
                <div class="input-group me-2">
                    <input class="form-control pe-xxl-5 text-left" type="text" name="full_name" id="full_name" <#if full_name??>value="${full_name}" </#if> placeholder="Поиск пациента по ФИО">
                    <a href="/" class="btn btn-danger">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                            <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
                        </svg>
                    </a>
                </div>
                <button class="btn btn-outline-primary" type="submit">Поиск</button>
            </form>
        </div>
    </div>
</nav>

<br><br>



    <h3 align="center">ЖУРНАЛ УЧЕТА ПРИЕМА ПАЦИЕНТОВ И ОТКАЗОВ В ОКАЗАНИИ МЕДИЦИНСКОЙ ПОМОЩИ<br>
        В СТАЦИОНАРНЫХ УСЛОВИЯХ, В УСЛОВИЯХ ДНЕВНОГО СТАЦИОНАРА</h3>

    <hr>

<#--    <div class="container-fluid">-->
<#--        <form action="/" method="get" autocomplete="off">-->
<#--            <label class="form-label" for="full_name">Поиск пациента по ФИО</label>-->
<#--            <div class="input-group">-->
<#--                <input class="form-control" type="text" name="full_name" id="full_name" <#if full_name??>value="${full_name}" </#if>>-->
<#--                <a href="/" class="btn btn-outline-primary">-->
<#--                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">-->
<#--                        <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>-->
<#--                    </svg>-->
<#--                </a>-->
<#--                <input class="btn btn-primary" type="submit" value="Поиск">-->
<#--            </div>-->
<#--        </form>-->
<#--    </div>-->

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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

    <script>

        function onCopyInput() {

            const data2 = document.getElementById('data2');
            const data1 = document.getElementById('data1');

            let dateUpdate = new Date(data1.value);

            dateUpdate.setDate(dateUpdate.getDate() + 1);  // Добавляем один день

            // Обновляем значение input
            data2.value = dateUpdate.toISOString().split('T')[0];
        }

        function onCopyInput1() {

            const data2 = document.getElementById('data22');
            const data1 = document.getElementById('data11');

            let dateUpdate = new Date(data1.value);

            // Добавляем один месяц
            dateUpdate.setMonth(dateUpdate.getMonth() + 1);

            // Обновляем значение input
            data2.value = dateUpdate.toISOString().split('T')[0];
        }

    </script>

</body>
</html>