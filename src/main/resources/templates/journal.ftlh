<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JOURNAL</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        #suggestions, #suggestions_country, #suggestions-stay, #suggestions_medical {
            border: 1px solid #ccc;
            max-height: 150px;
            overflow-y: auto;
            display: none; /* Скрываем изначально */
        }
        .suggestion-item, .suggestion-item-country, .suggestion-item-stay, .suggestion-item-medical {
            padding: 8px;
            cursor: pointer;
        }
        .suggestion-item, .suggestion-item-country, .suggestion-item-stay, .suggestion-item-medical:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
    <h3 align="center">ЖУРНАЛ УЧЕТА ПРИЕМА ПАЦИЕНТОВ И ОТКАЗОВ В ОКАЗАНИИ МЕДИЦИНСКОЙ ПОМОЩИ<br>
        В СТАЦИОНАРНЫХ УСЛОВИЯХ, В УСЛОВИЯХ ДНЕВНОГО СТАЦИОНАРА</h3>

    <hr>
    <form action="/" method="get" autocomplete="off">
        <label>Поиск пациента по ФИО<br><input type="text" name="full_name" <#if full_name??>value="${full_name}" </#if></label><a href="/">❌</a> <br><br>
        <input type="submit" value="Поиск">
        <hr>
    </form>
    <table class="table" border = "1px">
        <tr>
            <th>Редактирование</th>
            <th>Дата послупления</th>
            <th>Время послупления</th>
            <th>ФИО</th>
            <th>Дата рождения</th>
        </tr>
        <#list journals as journal>
            <tr>
                <td>
                    <a href="/journal/edit/${journal.id}">Редактировать</a>
                </td>
                <td><#if journal.date_receipt??> ${journal.normal_date} </#if></td>
                <td><#if journal.time_receipt??> ${journal.time_receipt} </#if></td>
                <td><#if journal.full_name??> ${journal.full_name} </#if></td>
                <td><#if journal.birth_day??> ${journal.normal_birth_day} </#if></td>
            </tr>
            <#else>
            <h3>Данные не найдены</h3>
        </#list>

    </table>
    <hr>
    <form action="/journal/save" method="post" autocomplete="off">
        <h4>Добавление записи</h4>
        <hr>
        <label>Дата поступления: <input type="date" name="date_receipt" value="${date_now}"></label><br><br>
        <label>Время поступления: <input type="text" name="string_time_receipt" value="${time_now}"></label><br><br>
        <label>Фамилия, имя, отчестов (при наличии): <input type="text" name="full_name"></label><br><br>
        <label>Дата рождения (число, месяц, год): <input type="date" name="birth_day"></label><br><br>
        <label>Пол (мужской, женский): <select name="gender" size="1">
                        <option selected value="m">мужской</option>
                        <option value="j">женский</option>
                    </select>
        </label><br><br>
        <label>Серия и номер паспорта или иного документа, удостоверяющего личность (при наличии): <input type="text" name="string_time_receipt" value="${time_now}"></label><br><br>
        <form id="countryForm" autocomplete="off">
            <label for="nationality">Гражданство:</label>
            <input type="text" id="nationality" name="nationality">
            <div id="suggestions_country"></div>
        </form>
        <br><br>
        <form action="/api/suggest-address" id="dataForm" autocomplete="off">
            <label for="address">Регистрация по месту жительсва:</label>
            <input type="text" id="address" name="address" autocomplete="off" size="100">
            <div id="suggestions"></div>
            <br><br>
            <label for="registration_place_stay">Регистрация по месту пребывания пациента:</label>
            <input type="text" id="registration_place_stay" name="registration_place_stay" autocomplete="off" size="100">
            <div id="suggestions-stay"></div>
            <input type="checkbox" id="fit" onclick="copyText()">
            <label for="fit">Совпадает с местом регистрации</label>
            <br><br>
        </form>
        <label for="phone">Номер телефона законного представителя, лица, которому может
            быть передана информация о состоянии здоровья пациента:</label>
        <input type="text" id="phone" maxlength="18" oninput="formatPhone(this)" autocomplete="off">
        <br><br>
        <label for="snils">СНИСЛ (при наличии):</label>
        <input type="text" id="snils" maxlength="14" oninput="formatSnils(this)" autocomplete="off"/>
        <br><br>
        <label for="snils">Полис обязательного медицинского страхования (при наличии):</label>
        <input type="text" id="snils" maxlength="16" autocomplete="off"/>
        <br><br>
        <label>Пациент доставлен (направлен): <select name="delivery" size="1">
                <option selected value="police">полицией</option>
                <option value="medicals">выездной бригадой скорой медицинской помощи</option>
                <option value="policlinica">другой медицинской организацией</option>
                <option value="yourself">обратился самостоятельно</option>
            </select>
        </label><br><br>
        <label>Номер медицинской карты: <input type="text" name="full_name"></label><br><br>

        <form action="/api/suggest-medical" id="medicalForm" autocomplete="off">
            <label for="medical">Код по МКД:</label>
            <input type="text" id="medical" name="medical">
            <div id="suggestions_medical"></div>
        </form>
        <br><br>


        <input type="submit" value="Добавить запись"><br>
        <hr>
    </form>





    <script>
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

                // Управление положением курсора
                const input = document.getElementById('address');

                input.focus();
                input.setSelectionRange(input.value.length, input.value.length);

                $('#address').val($(this).text());
                $('#suggestions').hide();




            });
        });

        $(document).ready(function() {
            $('#nationality').on('input', function () {
                const query = $(this).val();
                if (query.length > 2) { // минимальная длина запроса
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

                // Управление положением курсора
                const input = document.getElementById('nationality');

                input.focus();
                input.setSelectionRange(input.value.length, input.value.length);

                $('#nationality').val($(this).text());
                $('#suggestions_country').hide();


            });


        });

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

                // Управление положением курсора
                const input = document.getElementById('registration_place_stay');

                input.focus();
                input.setSelectionRange(input.value.length, input.value.length);

                $('#registration_place_stay').val($(this).text());
                $('#suggestions-stay').hide();

            });
        });

        function copyText() {
            const checkbox = document.getElementById("fit");
            const textField1 = document.getElementById("registration_place_stay");
            const textField2 = document.getElementById("address");

            if (checkbox.checked) {
                textField1.value = textField2.value;
            } else {
                textField1.value = ""; // Очистка текстового поля 1, если чекбокс не отмечен
            }
        }

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

                // Управление положением курсора
                const input = document.getElementById('medical').value.length;

                // input.focus();
                // input.setSelectionRange(input.value.length, input.value.length);

                const originalString = $(this).text();
                const trimmedString = originalString.slice(0, input + 2);
                $('#medical').val(trimmedString);
                $('#suggestions_medical').hide();



            });


        });

    </script>

    <br><br>



    <form method="get" action="/export/excel">
        <label>С <input type="date" name="data1"></label>
        <label>До <input type="date" name="data2"></label>

        <button type="submit">Экспортировать в Excel</button>
    </form>

</body>
</html>