<#macro page namePage="">
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ЖУРНАЛ УЧЕТА ПРИЕМА ПАЦИЕНТОВ</title>

        <style>
            #table-div {
                max-height: 600px;
                overflow-y: auto;
            }

            .table-container {
                height: 300px; /* Задайте желаемую высоту */
                overflow-y: auto; /* Включите вертикальную прокрутку */
                /*border: 1px solid #ccc; !* Добавьте границу для контейнера *!*/
            }
            .table-container table {
                width: 100%;
                border-collapse: collapse;
                padding: 5px;
            }
            .table-container th, td {
                /*padding: 10px;*/
                /*border: 1px solid #ddd;*/
                text-align: left;
                border: none;
            }
            .table-container thead th {
                position: sticky; /* Установите фиксированное положение для заголовков */
                top: 0; /* Прикрепите к верхней части контейнера */
                background-color: lightgray; /* Цвет фона заголовков */
                padding: 15px;
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
                border: 1px solid #ccc;
                max-height: 150px;
                overflow-y: auto;
                margin-bottom: 25px;
                margin-top: -25px;
                display: none; /* Скрываем изначально */
            }

            .suggestion-item, .suggestion-item-country, .suggestion-item-stay, .suggestion-item-medical,
            .suggestion-item-cause {
                padding: 8px;
                cursor: pointer;
            }

            /*.suggestion-item, .suggestion-item-stay, .suggestion-item-country, .suggestion-item-medical,*/
            /*.suggestion-item-cause:hover {*/
            /*    background-color: lightblue;*/
            /*}*/

            #medicalOrgField {
                display: none; /* Скрываем поле по умолчанию */
            }


            #scrollToTop {
                position: fixed;
                bottom: 30px;
                right: 30px;
                display: none;
                align-items: center;
                justify-content: center;
                cursor: pointer;
            }

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
        </style>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark py-3" id="sticky">
            <div class="container-fluid">
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
                        <li class="nav-item dropdown" style="z-index: 9999">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Формирование отчетов
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/journal/excel/day">Ежедневный отчет</a></li>
                                <li><a class="dropdown-item" href="/journal/excel/month">Ежемесячный отчет</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="/journal/report/get">История формирования отчетов</a></li>
                            </ul>
                        </li>
                    </ul>
                    <#if namePage == "journal">
                        <form action="/" method="get" autocomplete="off" class="d-flex">
                            <div class="input-group me-2">
                                <input class="form-control pe-xxl-5 text-left" name="full_name" id="full_name" <#if full_name??>value="${full_name}"</#if> type="text" placeholder="Поиск пациента по ФИО">
                                <a href="/" class="btn btn-danger">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                                        <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
                                    </svg>
                                </a>
                            </div>
                            <button class="btn btn-outline-primary" type="submit">Поиск</button>
                        </form>
                        <#else>
                    </#if>

                </div>
            </div>
        </nav>

        <#nested>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>

            // Подстановка даты для ежедневного отчета
            function onCopyInput() {

                const data2 = document.getElementById('data2');
                const data1 = document.getElementById('data1');

                let dateUpdate = new Date(data1.value);

                dateUpdate.setDate(dateUpdate.getDate() + 1);  // Добавляем один день

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