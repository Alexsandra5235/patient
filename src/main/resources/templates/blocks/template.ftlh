<#import "templateReport.ftlh" as t>

<#macro page titlePage typeReport="" namePage="">
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${titlePage}</title>

        <style>
            .blurBG {
                background-color: rgb(33 37 41 / 50%);
                backdrop-filter: blur(20px);
            }

            .table-container {
                /*height: 440px; !* Задайте желаемую высоту *!*/
                /*min-height: 100vh;*/
                overflow-y: auto; /* Включите вертикальную прокрутку */
                /*border: 1px solid #ccc; !* Добавьте границу для контейнера *!*/
            }
            .table-container table {
                width: 100%;
                border-collapse: collapse;
                /*padding: 5px;*/
                margin: 0;
            }
            .table-container tbody td {
                padding: 0;
            }
            .table-container th, td {
                /*padding: 10px;*/
                /*border: 1px solid #ddd;*/
                /*text-align: left;*/
                border: none;
                text-align: center; /* Центрирование по горизонтали */
                vertical-align: middle; /* Центрирование по вертикали */
            }
            .table-container thead td {
                position: sticky; /* Установите фиксированное положение для заголовков */
                top: 0; /* Прикрепите к верхней части контейнера */
                background-color: lightgray; /* Цвет фона заголовков */
                /*padding: 10px;*/
                /*z-index: 10; !* Убедитесь, что заголовки над остальными строками *!*/
            }

            #btn-show {
                width: 100%;
                display: block;
                box-sizing: border-box;
            }

            #suggestions, #suggestions_country, #suggestions-stay, #suggestions_medical,
            #suggestions_cause {
                background-color: white;
                /*border: 1px solid #212529;*/
                max-height: 150px;
                overflow-y: auto;
                margin-bottom: 25px;
                margin-top: -25px;
                display: none; /* Скрываем изначально */
                border-bottom-left-radius: 7px;
                border-bottom-right-radius: 7px;
            }

            .suggestion-item, .suggestion-item-country, .suggestion-item-stay, .suggestion-item-medical,
            .suggestion-item-cause {
                padding: 8px;
                cursor: pointer;
                color: black;
            }

            /*.suggestion-item, .suggestion-item-stay, .suggestion-item-country, .suggestion-item-medical,*/
            /*.suggestion-item-cause:hover {*/
            /*    background-color: lightblue;*/
            /*}*/

            #medicalOrgField {
                display: none; /* Скрываем поле по умолчанию */
            }


            /*#scrollToTop {*/
            /*    position: fixed;*/
            /*    bottom: 30px;*/
            /*    right: 30px;*/
            /*    display: none;*/
            /*    align-items: center;*/
            /*    justify-content: center;*/
            /*    cursor: pointer;*/
            /*}*/

            #card-day {
                width: 50vw;
                height: 50vh;
                display: flex;
                justify-content: center;
            }

            #sticky {
                position: sticky;
                z-index: 9999;
                top: 0;
            }

            body {
                animation: theme 21s linear infinite;

                &:after,
                &:before {
                    content: '';
                    display: block;
                    position: fixed;
                    z-index: -1;
                    top: 0;
                    width: 100vw;  // IE/Edge
                height: 100vh; // fallback
                width: 100vmax;
                    height: 100vmax;
                    background: rgba(0,0,0,0.05);
                    animation: background 90s linear infinite;
                }

                &:after {
                    left: 15vw;
                }

                &:before {
                    right: 15vw;
                    animation-delay: -30s;
                    animation-direction: reverse;
                }
            }

            @keyframes theme {
                0% {
                    background: #74C390;
                }

                16% {
                    background: #5DBDB6;
                }

                33% {
                    background: #59D4E1;
                }

                50% {
                    background: #51BCE8;
                }

                66% {
                    background: #5DBDB6;
                }

                83% {
                    background: #59D4E1;
                }

                100% {
                    background: #74C390;
                }
            }

            @keyframes background {
                0% {
                    transform: rotate(0deg);
                }

                100% {
                    transform: rotate(360deg);
                }
            }

            .edit-header {
                position: sticky;
                z-index: 9998;
                top: 48px;
            }

           body {
               /*overflow-y: scroll;*/
           }


        </style>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    </head>
    <body>

<#--        <div class="alert-primary" id="scrollToTop">-->
<#--            <a href="#" style="text-decoration: none">-->
<#--                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-arrow-up-circle" viewBox="0 0 16 16">-->
<#--                    <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>-->
<#--                </svg>-->
<#--            </a>-->
<#--        </div>-->

<#--        <nav class="navbar navbar-expand-lg navbar-dark bg-dark py-3" id="sticky">-->
<#--            <div class="container-fluid">-->
<#--                <a class="navbar-brand px-xxl-5" href="/">-->
<#--                    <div class="input-group align-content-center">-->
<#--                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-journals" viewBox="0 0 16 16">-->
<#--                            <path d="M5 0h8a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2 2 2 0 0 1-2 2H3a2 2 0 0 1-2-2h1a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1H1a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v9a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H5a1 1 0 0 0-1 1H3a2 2 0 0 1 2-2"/>-->
<#--                            <path d="M1 6v-.5a.5.5 0 0 1 1 0V6h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0V9h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 2.5v.5H.5a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1H2v-.5a.5.5 0 0 0-1 0"/>-->
<#--                        </svg>-->
<#--                        <span class="px-2">JOURNAL</span>-->
<#--                    </div>-->
<#--                </a>-->
<#--                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Переключатель навигации">-->
<#--                    <span class="navbar-toggler-icon"></span>-->
<#--                </button>-->
<#--                <div class="collapse navbar-collapse" id="navbarSupportedContent">-->
<#--                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">-->
<#--                        <li class="nav-item me-3">-->
<#--                            <a class="nav-link active" aria-current="page" href="/">Главная</a>-->
<#--                        </li>-->
<#--                        <li class="nav-item me-3">-->
<#--                            <a class="nav-link" aria-current="page" href="/journal/save">Добавить запись</a>-->
<#--                        </li>-->
<#--                        <li class="nav-item dropdown" style="z-index: 9999">-->
<#--                            <a class="nav-link dropdown-toggle" aria-current="page" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">-->
<#--                                Формирование отчетов-->
<#--                            </a>-->
<#--                            <ul class="dropdown-menu">-->
<#--                                <li><a class="dropdown-item" href="/journal/excel/day">Ежедневный отчет</a></li>-->
<#--                                <li><a class="dropdown-item" href="/journal/excel/month">Ежемесячный отчет</a></li>-->
<#--                                <li><hr class="dropdown-divider"></li>-->
<#--                                <li><a class="dropdown-item" href="/journal/report/get">История формирования отчетов</a></li>-->
<#--                            </ul>-->
<#--                        </li>-->
<#--                        <li class="nav-item me-3">-->
<#--                            <a class="nav-link" aria-current="page" href="/mkd/info">Справочная информация</a>-->
<#--                        </li>-->
<#--                    </ul>-->
<#--                    <#if namePage == "journal">-->
<#--                        <form action="/" method="get" autocomplete="off" class="d-flex">-->
<#--                            <div class="input-group me-2">-->
<#--                                <input class="form-control pe-xxl-5 text-left" name="full_name" id="full_name" <#if full_name??>value="${full_name}"</#if> type="text" placeholder="Поиск пациента по ФИО">-->
<#--                                <a href="/" class="btn btn-danger">-->
<#--                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">-->
<#--                                        <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>-->
<#--                                    </svg>-->
<#--                                </a>-->
<#--                            </div>-->
<#--                            <button class="btn btn-primary" type="submit">Поиск</button>-->
<#--                        </form>-->
<#--                    </#if>-->
<#--                </div>-->
<#--            </div>-->
<#--        </nav>-->
<#--        <div class="d-flex flex-column flex-shrink-0 bg-light" style="width: 4.5rem;">-->
<#--            <a href="/" class="d-block p-3 link-dark text-decoration-none" title="Icon-only" data-bs-toggle="tooltip" data-bs-placement="right">-->
<#--                <svg class="bi" width="40" height="32"><use xlink:href="#bootstrap"/></svg>-->
<#--                <span class="visually-hidden">Icon-only</span>-->
<#--            </a>-->
<#--            <ul class="nav nav-pills nav-flush flex-column mb-auto text-center">-->
<#--                <li class="nav-item">-->
<#--                    <a href="#" class="nav-link active py-3 border-bottom" aria-current="page" title="Home" data-bs-toggle="tooltip" data-bs-placement="right">-->
<#--                        <svg class="bi" width="24" height="24" role="img" aria-label="Home"><use xlink:href="#home"/></svg>-->
<#--                    </a>-->
<#--                </li>-->
<#--                <li>-->
<#--                    <a href="#" class="nav-link py-3 border-bottom" title="Dashboard" data-bs-toggle="tooltip" data-bs-placement="right">-->
<#--                        <svg class="bi" width="24" height="24" role="img" aria-label="Dashboard"><use xlink:href="#speedometer2"/></svg>-->
<#--                    </a>-->
<#--                </li>-->
<#--                <li>-->
<#--                    <a href="#" class="nav-link py-3 border-bottom" title="Orders" data-bs-toggle="tooltip" data-bs-placement="right">-->
<#--                        <svg class="bi" width="24" height="24" role="img" aria-label="Orders"><use xlink:href="#table"/></svg>-->
<#--                    </a>-->
<#--                </li>-->
<#--                <li>-->
<#--                    <a href="#" class="nav-link py-3 border-bottom" title="Products" data-bs-toggle="tooltip" data-bs-placement="right">-->
<#--                        <svg class="bi" width="24" height="24" role="img" aria-label="Products"><use xlink:href="#grid"/></svg>-->
<#--                    </a>-->
<#--                </li>-->
<#--                <li>-->
<#--                    <a href="#" class="nav-link py-3 border-bottom" title="Customers" data-bs-toggle="tooltip" data-bs-placement="right">-->
<#--                        <svg class="bi" width="24" height="24" role="img" aria-label="Customers"><use xlink:href="#people-circle"/></svg>-->
<#--                    </a>-->
<#--                </li>-->
<#--            </ul>-->
<#--            <div class="dropdown border-top">-->
<#--                <a href="#" class="d-flex align-items-center justify-content-center p-3 link-dark text-decoration-none dropdown-toggle" id="dropdownUser3" data-bs-toggle="dropdown" aria-expanded="false">-->
<#--                    <img src="https://github.com/mdo.png" alt="mdo" width="24" height="24" class="rounded-circle">-->
<#--                </a>-->
<#--                <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser3">-->
<#--                    <li><a class="dropdown-item" href="#">New project...</a></li>-->
<#--                    <li><a class="dropdown-item" href="#">Settings</a></li>-->
<#--                    <li><a class="dropdown-item" href="#">Profile</a></li>-->
<#--                    <li><hr class="dropdown-divider"></li>-->
<#--                    <li><a class="dropdown-item" href="#">Sign out</a></li>-->
<#--                </ul>-->
<#--            </div>-->


<#--        <div class="container-fluid p-0 d-flex vh-100">-->
        <div class="d-flex" style="position: absolute">
            <div class="bg-dark d-flex flex-column vh-100 p-3" style="width: 25%">
<#--                <div class="d-inline-flex">-->
<#--                    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">-->
<#--                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-journals" viewBox="0 0 16 16">&ndash;&gt;-->
<#--                            <path d="M5 0h8a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2 2 2 0 0 1-2 2H3a2 2 0 0 1-2-2h1a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1H1a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v9a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H5a1 1 0 0 0-1 1H3a2 2 0 0 1 2-2"/>-->
<#--                            <path d="M1 6v-.5a.5.5 0 0 1 1 0V6h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0V9h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 2.5v.5H.5a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1H2v-.5a.5.5 0 0 0-1 0"/>-->
<#--                        </svg>-->
<#--                        <span class="px-2">JOURNAL</span>-->
<#--                    </a>-->
<#--                    <a href="/" class="btn btn-primary">-->
<#--                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">-->
<#--                            <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>-->
<#--                        </svg>-->
<#--                        Назад на главную-->
<#--                    </a>-->
<#--                </div>-->

                <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-journals" viewBox="0 0 16 16">-->
                        <path d="M5 0h8a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2 2 2 0 0 1-2 2H3a2 2 0 0 1-2-2h1a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1H1a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v9a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H5a1 1 0 0 0-1 1H3a2 2 0 0 1 2-2"/>
                        <path d="M1 6v-.5a.5.5 0 0 1 1 0V6h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0V9h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 2.5v.5H.5a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1H2v-.5a.5.5 0 0 0-1 0"/>
                    </svg>
                    <span class="px-2">JOURNAL</span>
                </a>

                    <hr class="text-white">
                    <ul class="nav nav-pills flex-column mb-auto">
                        <li class="nav-item">
                            <a href="/" class="nav-link active text-white" aria-current="page" style="text-wrap: wrap">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
                                    <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5ZM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5 5 5Z"/>
                                </svg>
                                Главная
                            </a>
                        </li>
                        <li>
                            <a href="/journal/save" class="nav-link text-white" aria-current="page" style="text-wrap: wrap">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                                    <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                    <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                                </svg>
                                Добавление записи
                            </a>
                        </li>
                        <li>
                            <a href="/mkd/info" class="nav-link text-white" aria-current="page" style="text-wrap: wrap">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16">
                                    <path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/>
                                </svg>
                                Справочная информация
                            </a>
                        </li>
                        <li class="nav-item dropdown" style="z-index: 9999">
                            <a style="text-wrap: wrap" class="nav-link dropdown-toggle text-white" aria-current="page" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-file-text" viewBox="0 0 16 16">
                                    <path d="M5 4a.5.5 0 0 0 0 1h6a.5.5 0 0 0 0-1H5zm-.5 2.5A.5.5 0 0 1 5 6h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zM5 8a.5.5 0 0 0 0 1h6a.5.5 0 0 0 0-1H5zm0 2a.5.5 0 0 0 0 1h3a.5.5 0 0 0 0-1H5z"/>
                                    <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2zm10-1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1z"/>
                                </svg>
                                Формирование отчетов
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark text-small shadow" style="text-wrap: wrap">
                                <li><a class="dropdown-item" href="/journal/excel/day">Ежедневный отчет</a></li>
                                <li><a class="dropdown-item" href="/journal/excel/month">Ежемесячный отчет</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="/journal/report/get">История формирования отчетов</a></li>
                            </ul>
                        </li>
                        <#if namePage = "addJournal">
                            <li>
                                <div class="card bg-primary text-white p-3 mt-4">
                                    <p style="margin: 0">Добавление записи</p>
                                    <hr>
                                    <p class="card-text">Нажмите на соответствующую кнопку ниже, если необходимо <span style="font-weight: bold" class="card-text text-dark">добавить</span>
                                        новую запись или <span style="font-weight: bold" class="card-text text-dark">отчистить</span> внесенные данные.</p>
                                    <button type="submit" class="btn btn-success mb-2" id="btnAddJournal" onclick="forAdd()">
                                        Добавить запись
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
                                            <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                            <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
                                        </svg>
                                    </button>
                                    <button type="submit" class="btn btn-secondary" onclick="window.location.reload()">
                                        Отчистить форму
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-eraser" viewBox="0 0 16 16">
                                            <path d="M8.086 2.207a2 2 0 0 1 2.828 0l3.879 3.879a2 2 0 0 1 0 2.828l-5.5 5.5A2 2 0 0 1 7.879 15H5.12a2 2 0 0 1-1.414-.586l-2.5-2.5a2 2 0 0 1 0-2.828l6.879-6.879zm2.121.707a1 1 0 0 0-1.414 0L4.16 7.547l5.293 5.293 4.633-4.633a1 1 0 0 0 0-1.414l-3.879-3.879zM8.746 13.547 3.453 8.254 1.914 9.793a1 1 0 0 0 0 1.414l2.5 2.5a1 1 0 0 0 .707.293H7.88a1 1 0 0 0 .707-.293l.16-.16z"/>
                                        </svg>
                                    </button>
                                </div>
                            </li>
                        </#if>
                        <#if namePage = "infoJournal">
                            <div class="card bg-primary text-white p-3 mt-4">
                                <p style="margin: 0">Просмотр записи</p>
                                <hr>
                                <p class="card-text">Нажмите на соответствующую кнопку ниже, если необходимо <span style="font-weight: bold" class="card-text text-dark">редактировать</span>
                                    новую запись или <span style="font-weight: bold" class="card-text text-dark">удалить</span> запись.</p>
                                <button type="submit" class="btn btn-success mb-2" id="btnEditJournal" onclick="forEdit()">
                                    Редактировать запись
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-vector-pen" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M10.646.646a.5.5 0 0 1 .708 0l4 4a.5.5 0 0 1 0 .708l-1.902 1.902-.829 3.313a1.5 1.5 0 0 1-1.024 1.073L1.254 14.746 4.358 4.4A1.5 1.5 0 0 1 5.43 3.377l3.313-.828L10.646.646zm-1.8 2.908-3.173.793a.5.5 0 0 0-.358.342l-2.57 8.565 8.567-2.57a.5.5 0 0 0 .34-.357l.794-3.174-3.6-3.6z"/>
                                        <path fill-rule="evenodd" d="M2.832 13.228 8 9a1 1 0 1 0-1-1l-4.228 5.168-.026.086.086-.026z"/>
                                    </svg>
                                </button>
                                <button type="submit" onclick="forDelete()" class="btn btn-secondary">
                                    Удалить запись
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                        <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/>
                                    </svg>
                                </button>
                            </div>
                        </#if>
                        <#if namePage = "editJournal">
                            <div class="card bg-primary text-white p-3 mt-4">
                                <p style="margin: 0">Редактирование записи</p>
                                <hr>
                                <p class="card-text">Нажмите на соответствующую кнопку ниже, если необходимо <span style="font-weight: bold" class="card-text text-dark">отчистить</span>
                                    внесенные изменения или <span style="font-weight: bold" class="card-text text-dark">сохранить</span> их.</p>
                                <button type="submit" class="btn btn-secondary mb-2" id="btnEditJournal" onclick="location.reload()">
                                    Отчистить измнения
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eraser" viewBox="0 0 16 16">
                                        <path d="M8.086 2.207a2 2 0 0 1 2.828 0l3.879 3.879a2 2 0 0 1 0 2.828l-5.5 5.5A2 2 0 0 1 7.879 15H5.12a2 2 0 0 1-1.414-.586l-2.5-2.5a2 2 0 0 1 0-2.828l6.879-6.879zm2.121.707a1 1 0 0 0-1.414 0L4.16 7.547l5.293 5.293 4.633-4.633a1 1 0 0 0 0-1.414l-3.879-3.879zM8.746 13.547 3.453 8.254 1.914 9.793a1 1 0 0 0 0 1.414l2.5 2.5a1 1 0 0 0 .707.293H7.88a1 1 0 0 0 .707-.293l.16-.16z"/>
                                    </svg>
                                </button>
                                <button type="submit" onclick="forSaveEdit()" class="btn btn-success">
                                    Сохранить запись
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-floppy2" viewBox="0 0 16 16">
                                        <path d="M1.5 0h11.586a1.5 1.5 0 0 1 1.06.44l1.415 1.414A1.5 1.5 0 0 1 16 2.914V14.5a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 14.5v-13A1.5 1.5 0 0 1 1.5 0ZM1 1.5v13a.5.5 0 0 0 .5.5H2v-4.5A1.5 1.5 0 0 1 3.5 9h9a1.5 1.5 0 0 1 1.5 1.5V15h.5a.5.5 0 0 0 .5-.5V2.914a.5.5 0 0 0-.146-.353l-1.415-1.415A.5.5 0 0 0 13.086 1H13v3.5A1.5 1.5 0 0 1 11.5 6h-7A1.5 1.5 0 0 1 3 4.5V1H1.5a.5.5 0 0 0-.5.5Zm9.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-1Z"/>
                                    </svg>
                                </button>
                            </div>
                        </#if>

                    </ul>
                    <hr class="text-white">
                    <div class="dropdown">
                        <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
                            <strong>mdo</strong>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
                            <li><a class="dropdown-item" href="#">New project...</a></li>
                            <li><a class="dropdown-item" href="#">Settings</a></li>
                            <li><a class="dropdown-item" href="#">Profile</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">Sign out</a></li>
                        </ul>
                    </div>
            </div>
<#--        </div>-->

            <@t.report typeReport=typeReport>

            </@t.report>

            <#nested>

        </div>




        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>

            function forAdd(){
                let btnForm = document.getElementById('btnFormAdd');
                btnForm.click();
            }

            function forEdit(){
                let btnFormEdit = document.getElementById('formEditRecord');
                btnFormEdit.click();
            }

            function forDelete(){
                let btnDelete = document.getElementById('btnDelete');
                btnDelete.click();
            }

            function forSaveEdit(){
                let btnSaveEdit = document.getElementById('btnSaveEdit');
                btnSaveEdit.click();
            }


            // let btnFormEdit = document.getElementById('formEditRecord');
            // let btnEdit = document.getElementById('btnEditJournal');
            //
            // btnEdit.addEventListener('click', function(event) {
            //     btnFormEdit.click();
            // });


            document.addEventListener("DOMContentLoaded", function() {
                // Получаем все элементы навигации
                const navLinks = document.querySelectorAll('.nav-link');

                // Удаляем класс active у всех пунктов
                navLinks.forEach(nav => nav.classList.remove('active'));

                navLinks.forEach(link => {
                    link.addEventListener('click', function(e) {

                        // Добавляем класс active к текущему пункту
                        this.classList.add('active');

                        // Если пункт является выпадающим, выделяем родительский элемент
                        if (this.closest('.dropdown')) {
                            const dropdownToggle = this.closest('.dropdown').querySelector('.dropdown-toggle');
                            dropdownToggle.classList.add('active');
                        }
                    });
                });

                // Получаем все элементы навигации
                const navDropdown = document.querySelectorAll('.dropdown-item');

                // Устанавливаем "active" для текущей страницы при загрузке
                const currentLocation = window.location.pathname;

                navLinks.forEach(link => {
                    if (link.getAttribute('href') === currentLocation) {
                        link.classList.add('active');
                    }

                });

                navDropdown.forEach(link => {
                    if (link.getAttribute('href') === currentLocation){
                        // Проверяем, является ли это выпадающим пунктом
                        if (link.closest('.dropdown')) {
                            const dropdownToggle = link.closest('.dropdown').querySelector('.dropdown-toggle');
                            dropdownToggle.classList.add('active');
                        }
                    }
                })
            });

            function checkSelectSearchReport(){
                const selectSearch = document.getElementById('selectSearch');

                const containerSearch = document.getElementById('containerSearch');
                const containerSearch2 = document.getElementById('containerSearch2');
                const containerSearch3 = document.getElementById('containerSearch3');


                const valueSelect = document.getElementById('valueSelect');
                const valueSelect2 = document.getElementById('valueSelect2');
                const valueSelect3 = document.getElementById('valueSelect3');

                valueSelect.value = selectSearch.value.toString();
                valueSelect2.value = selectSearch.value.toString();
                valueSelect3.value = selectSearch.value.toString();

                if (selectSearch.value === '0'){
                    containerSearch.style.display = 'none';
                    containerSearch3.style.display = 'none';
                    containerSearch2.style.display = 'none';
                } else if (selectSearch.value === '1'){
                    containerSearch.style.display = 'block';
                    containerSearch3.style.display = 'none'
                    containerSearch2.style.display = 'none'
                } else if (selectSearch.value === '3'){
                    containerSearch3.style.display = 'block';
                    containerSearch2.style.display = 'none';
                    containerSearch.style.display = 'none';
                } else if (selectSearch.value === '2'){
                    containerSearch3.style.display = 'none';
                    containerSearch2.style.display = 'block';
                    containerSearch.style.display = 'none';
                }
            }

            // открытие файла без скачивания
            function viewReport(id) {
                window.open('/viewReport/' + id, '_blank'); // Открываем отчет в новом окне
            }

            // // Сохраняем позицию прокрутки перед перезагрузкой
            // window.onbeforeunload = function() {
            //     localStorage.setItem('scrollPos', window.scrollY); // Сохраняем текущую позицию
            // };
            //
            // // Восстанавливаем позицию прокрутки при загрузке
            // window.onload = function() {
            //     const scrollPos = localStorage.getItem('scrollPos'); // Получаем сохранённое значение
            //     if (scrollPos) {
            //         window.scrollTo(0, scrollPos); // Прокручиваем на сохранённое значение
            //     }
            // };

            // сортировка данных в таблице по дате поступления
            function filterData(){

                const inputSort = document.getElementById('sort');

                if (inputSort.value === 'desc'){
                    inputSort.value = 'asc'
                }
                else if (inputSort.value === 'asc'){
                    inputSort.value = 'desc'
                }
                else {
                    inputSort.value = 'desc'
                }
                // inputSort.value = inputSort.value === 'asc' ? 'desc' : 'asc';
                const formSort = document.getElementById('formSort');

                formSort.submit();
            }

            // Подстановка даты для ежедневного отчета
            function onCopyInput() {

                const typeReport = document.getElementById('typeReport');
                const data2 = document.getElementById('data2');
                const data1 = document.getElementById('data1');

                let dateUpdate = new Date(data1.value);

                if (typeReport.value === 'day'){
                    dateUpdate.setDate(dateUpdate.getDate() + 1);  // Добавляем один день
                } else if (typeReport.value === 'month'){
                    // Добавляем один месяц
                    dateUpdate.setMonth(dateUpdate.getMonth() + 1);
                }

                // Обновляем значение input
                data2.value = dateUpdate.toISOString().split('T')[0];


            }

            // Подстановка даты для ежемесячного отчета
            function onCopyInput1() {

                // Подстановка даты для ежемесячного отчета
                const data2 = document.getElementById('data22');
                const data1 = document.getElementById('data11');

                let dateUpdate = new Date(data1.value);

                // Добавляем один месяц
                dateUpdate.setMonth(dateUpdate.getMonth() + 1);

                // Обновляем значение input
                data2.value = dateUpdate.toISOString().split('T')[0];
            }

            // после загрузки страницы
            $(function(){

                // инициализации подсказок для всех элементов на странице, имеющих атрибут data-toggle="tooltip"
                $('[data-bs-toggle="tooltip"]').tooltip();
                // Проверяем значение select при загрузке страницы
                toggleMedicalOrgField();

                const scrollToTopButton = document.getElementById('scrollToTop');

                // Слушаем событие прокрутки
                window.addEventListener("scroll", function () {
                    if (document.documentElement.scrollTop > 300) {
                        scrollToTopButton.style.display = "block"; // Показываем div
                    } else {
                        scrollToTopButton.style.display = "none"; // Скрываем div
                    }
                });

            });


            // Получение подсказок для адреса прописки
            $(document).ready(function() {
                $('#address').on('input', function() {
                    const query = $(this).val();
                    if (query.length > 2) { // минимальная длина запроса
                        $.ajax({
                            url: '/api/suggest-address',
                            method: 'GET',
                            data: { query: query },
                            success: function(data) {
                                $('#suggestions').empty().show();
                                data.forEach(function(item) {
                                    $('#suggestions').append('<div class="suggestion-item">' + item + '</div>');
                                });

                            },
                            error: function(jqXHR, textStatus, errorThrown) {
                                console.error('Ошибка запроса:', textStatus, errorThrown);
                            }
                        });
                    } else {
                        $('#suggestions').hide();
                    }
                });

                $(document).on('click', '.suggestion-item', function() {

                    $('#address').val($(this).text());
                    $('#suggestions').hide();

                    // Управление положением курсора
                    const input = document.getElementById('address');

                    input.focus();
                    input.setSelectionRange(input.value.length, input.value.length);

                });

                // Скрываем подсказки при клике вне них
                $(document).on('click', function(event) {
                    if (!$(event.target).closest('#suggestions').length && !$(event.target).is('#address')) {
                        $('#suggestions').hide();
                    }
                });
            });

            // Получение подсказок для выбора национальности
            $(document).ready(function() {
                $('#nationality').on('input', function () {
                    const query = $(this).val();
                    if (query.length > 1) { // минимальная длина запроса
                        $.ajax({
                            url: '/api/suggest-country',
                            method: 'GET',
                            data: {query: query},
                            success: function (data) {
                                $('#suggestions_country').empty().show();
                                data.forEach(function (item) {
                                    $('#suggestions_country').append('<div class="suggestion-item-country">' + item + '</div>');
                                });

                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.error('Ошибка запроса:', textStatus, errorThrown);
                            }
                        });
                    } else {
                        $('#suggestions_country').hide();
                    }
                });

                $(document).on('click', '.suggestion-item-country', function () {

                    $('#nationality').val($(this).text());
                    $('#suggestions_country').hide();

                    // Управление положением курсора
                    const input = document.getElementById('nationality');

                    input.focus();
                    input.setSelectionRange(input.value.length, input.value.length);
                });
                // Скрываем подсказки при клике вне них
                $(document).on('click', function(event) {
                    if (!$(event.target).closest('#suggestions_country').length && !$(event.target).is('#nationality')) {
                        $('#suggestions_country').hide();
                    }
                });

            });

            // Получение подсказок для адреса прописки
            $(document).ready(function() {
                $('#registration_place_stay').on('input', function() {
                    const query = $(this).val();
                    if (query.length > 2) { // минимальная длина запроса
                        $.ajax({
                            url: '/api/suggest-address',
                            method: 'GET',
                            data: { query: query },
                            success: function(data) {
                                $('#suggestions-stay').empty().show();
                                data.forEach(function(item) {
                                    $('#suggestions-stay').append('<div class="suggestion-item-stay">' + item + '</div>');
                                });

                            },
                            error: function(jqXHR, textStatus, errorThrown) {
                                console.error('Ошибка запроса:', textStatus, errorThrown);
                            }
                        });
                    } else {
                        $('#suggestions-stay').hide();
                    }
                });

                $(document).on('click', '.suggestion-item-stay', function() {

                    $('#registration_place_stay').val($(this).text());
                    $('#suggestions-stay').hide();

                    // Управление положением курсора
                    const input = document.getElementById('registration_place_stay');

                    input.focus();
                    input.setSelectionRange(input.value.length, input.value.length);

                });
                // Скрываем подсказки при клике вне них
                $(document).on('click', function(event) {
                    if (!$(event.target).closest('#suggestions-stay').length && !$(event.target).is('#registration_place_stay')) {
                        $('#suggestions-stay').hide();
                    }
                });
            });

            // При нажатии на кнопку "Совпадает с местом регистрации"
            function copyText() {
                const textField1 = document.getElementById("registration_place_stay");
                const textField2 = document.getElementById("address");

                textField1.value = textField2.value;

            }

            // Формат для ввода мобильного телефона
            function formatPhone(input) {
                const value = input.value.replace(/\D/g, ''); // Убираем все нецифровые символы
                let formattedValue = '';

                // Форматируем номер
                if (value.length > 0) {
                    formattedValue += '8 (';
                }
                if (value.length > 1) {
                    formattedValue += value.slice(1, 4); // Код страны
                }
                if (value.length >= 4) {
                    formattedValue += ') ' + value.slice(4, 7); // Код оператора
                }
                if (value.length >= 7) {
                    formattedValue += ' ' + value.slice(7, 9); // Первые 2 цифры
                }
                if (value.length >= 9) {
                    formattedValue += ' ' + value.slice(9, 11); // Следующие 2 цифры
                }

                input.value = formattedValue;
            }

            // Формат для ввода номера снилса
            function formatSnils(input) {
                // Убираем все нецифровые символы
                const value = input.value.replace(/\D/g, '');
                let formattedValue = '';

                // Форматируем СНИЛС
                if (value.length > 0) {
                    formattedValue += value.slice(0, 3); // Первые 3 цифры
                }
                if (value.length >= 3) {
                    formattedValue += '-' + value.slice(3, 6); // Следующие 3 цифры
                }
                if (value.length >= 6) {
                    formattedValue += '-' + value.slice(6, 9); // Следующие 3 цифры
                }
                if (value.length >= 9) {
                    formattedValue += ' ' + value.slice(9, 11); // Последние 2 цифры
                }

                input.value = formattedValue;
            }




            // Получение подсказок кода МКД
            $(document).ready(function() {
                $('#medical').on('input', function () {
                    const query = $(this).val();
                    if (query.length > 1) { // минимальная длина запроса
                        $.ajax({
                            url: '/api/suggest-medical',
                            method: 'GET',
                            data: {query: query},
                            success: function (data) {
                                $('#suggestions_medical').empty().show();
                                data.forEach(function(item) {
                                    $('#suggestions_medical').append('<div class="suggestion-item-medical">' + item + '</div>');
                                });

                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.error('Ошибка запроса:', textStatus, errorThrown);
                            }
                        });
                    } else {
                        $('#suggestions_medical').hide();
                    }
                });

                $(document).on('click', '.suggestion-item-medical', function () {

                    const originalString = $(this).text();
                    const trimmedString = originalString.split(' - ')[0];
                    $('#medical').val(trimmedString);
                    $('#suggestions_medical').hide();

                    // Управление положением курсора
                    const input = document.getElementById('medical');

                    input.focus();
                    input.setSelectionRange(input.value.length, input.value.length);



                });

                // Скрываем подсказки при клике вне них
                $(document).on('click', function(event) {
                    if (!$(event.target).closest('#suggestions_medical').length && !$(event.target).is('#medical')) {
                        $('#suggestions_medical').hide();
                    }
                });

            });

            // Получение подсказок кода МКД
            $(document).ready(function() {
                $('#cause_injury').on('input', function () {
                    const query = $(this).val();
                    if (query.length > 1) { // минимальная длина запроса
                        $.ajax({
                            url: '/api/suggest-medical',
                            method: 'GET',
                            data: {query: query},
                            success: function (data) {
                                $('#suggestions_cause').empty().show();
                                data.forEach(function(item) {
                                    $('#suggestions_cause').append('<div class="suggestion-item-cause">' + item + '</div>');
                                });

                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.error('Ошибка запроса:', textStatus, errorThrown);
                            }
                        });
                    } else {
                        $('#suggestions_cause').hide();
                    }
                });

                $(document).on('click', '.suggestion-item-cause', function () {

                    const originalString = $(this).text();
                    const trimmedString = originalString.split(' - ')[0];
                    $('#cause_injury').val(trimmedString);
                    $('#suggestions_cause').hide();

                    // Управление положением курсора
                    const input = document.getElementById('cause_injury');

                    input.focus();
                    input.setSelectionRange(input.value.length, input.value.length);

                });
                // Скрываем подсказки при клике вне них
                $(document).on('click', function(event) {
                    if (!$(event.target).closest('#suggestions_cause').length && !$(event.target).is('#cause_injury')) {
                        $('#suggestions_cause').hide();
                    }
                });

            });

            // Формат ввода паспортных данных
            function formatPassportInput(input) {
                // Убираем все нецифровые символы
                let value = input.value.replace(/\D/g, '');

                // Форматируем строку, добавляя пробелы
                if (value.length > 6) {
                    value = value.slice(0, 2) + ' ' + value.slice(2, 4) + ' ' + value.slice(4, 10);
                } else if (value.length > 4) {
                    value = value.slice(0, 2) + ' ' + value.slice(2, 4) + ' ' + value.slice(4);
                } else if (value.length > 2) {
                    value = value.slice(0, 2) + ' ' + value.slice(2);
                }

                // Обновляем значение input
                input.value = value;
            }

            // Ввод текста в верхнем регистре для поля МКД
            function toUpperCaseInput(input) {

                // Обновляем значение input
                input.value = input.value.replace(/[^0-9a-zA-Z.]/g, '').toUpperCase();
            }

            // Управление видимостью поля ввода для select "Исход госпитализации"
            function toggleMedicalOrgField() {
                const medicalOrgField = document.getElementById('medicalOrgField');
                const select = document.getElementById('outcome_hospitalization');
                let input = document.getElementById('medical_organization_transferred');
                // Проверяем выбрано ли значение "переведен"
                if (select.value === 'переведен в другую медицинскую организацию') {
                    medicalOrgField.style.display = 'block'; // Показываем поле
                } else {
                    medicalOrgField.style.display = 'none'; // Скрываем поле
                    input.value = '';
                }
            }

        </script>


    </body>
    </html>
</#macro>