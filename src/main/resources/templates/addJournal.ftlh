<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JOURNAL</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>

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

        /*.suggestion-item, .suggestion-item-country, .suggestion-item-stay, .suggestion-item-medical,*/
        /*.suggestion-item-cause:hover {*/
        /*    background-color: #f0f0f0;*/
        /*}*/

        .suggestion-item:hover {
            background-color: lightblue;
        }
        .suggestion-item-stay:hover {
            background-color: lightblue;
        }

        .suggestion-item-country:hover
        {
            background-color: lightblue;
        }

        .suggestion-item-medical:hover {
            background-color: lightblue;
        }

        .suggestion-item-cause:hover {
            background-color: lightblue;
        }
        #medicalOrgField {
            display: none; /* Скрываем поле по умолчанию */
        }

        #h3{
            text-align: center;
        }

        .form-control, .form-select {
            margin-bottom: 25px;
        }
    </style>

<#--    <!-- Bootstrap CSS &ndash;&gt;-->
<#--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"-->
<#--          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"-->
<#--          crossorigin="anonymous">-->

<#--    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">-->
<#--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">-->


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

</head>
<body>
    <h3 id="h3">ЖУРНАЛ УЧЕТА ПРИЕМА ПАЦИЕНТОВ И ОТКАЗОВ В ОКАЗАНИИ МЕДИЦИНСКОЙ ПОМОЩИ<br>
        В СТАЦИОНАРНЫХ УСЛОВИЯХ, В УСЛОВИЯХ ДНЕВНОГО СТАЦИОНАРА</h3>

    <div class="container text-left">
        <form action="/journal/add" method="post" autocomplete="off">
            <h4>Добавление записи</h4>
            <hr>
            <label class="form-label" for="date_receipt">Дата поступления
                <a href="#" style="text-decoration: none"
                   data-bs-toggle="tooltip" data-bs-placement="top"
                   data-bs-custom-class="custom-tooltip"
                   data-bs-title="Это поле обязательно для заполнения">
                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" style="color: dodgerblue" class="bi bi-asterisk" viewBox="0 0 16 16">
                        <path d="M8 0a1 1 0 0 1 1 1v5.268l4.562-2.634a1 1 0 1 1 1 1.732L10 8l4.562 2.634a1 1 0 1 1-1 1.732L9 9.732V15a1 1 0 1 1-2 0V9.732l-4.562 2.634a1 1 0 1 1-1-1.732L6 8 1.438 5.366a1 1 0 0 1 1-1.732L7 6.268V1a1 1 0 0 1 1-1"/>
                    </svg>
                </a>
            </label><br>
            <input class="form-control" type="date" name="date_receipt" id="date_receipt" value="${date_now}" required>

            <label class="form-label" for="string_time_receipt">Время поступления
                <a href="#" style="text-decoration: none"
                   data-bs-toggle="tooltip" data-bs-placement="top"
                   data-bs-custom-class="custom-tooltip"
                   data-bs-title="Это поле обязательно для заполнения">
                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" style="color: dodgerblue" class="bi bi-asterisk" viewBox="0 0 16 16">
                        <path d="M8 0a1 1 0 0 1 1 1v5.268l4.562-2.634a1 1 0 1 1 1 1.732L10 8l4.562 2.634a1 1 0 1 1-1 1.732L9 9.732V15a1 1 0 1 1-2 0V9.732l-4.562 2.634a1 1 0 1 1-1-1.732L6 8 1.438 5.366a1 1 0 0 1 1-1.732L7 6.268V1a1 1 0 0 1 1-1"/>
                    </svg>
                </a>
            </label><br>
            <input class="form-control" type="time" name="string_time_receipt" id="string_time_receipt" maxlength="5" value="${time_now}" required>

            <label class="form-label" for="full_name">Фамилия, имя, отчестов (при наличии)
                <a href="#" style="text-decoration: none"
                   data-bs-toggle="tooltip" data-bs-placement="top"
                   data-bs-custom-class="custom-tooltip"
                   data-bs-title="Это поле обязательно для заполнения">
                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" style="color: dodgerblue" class="bi bi-asterisk" viewBox="0 0 16 16">
                        <path d="M8 0a1 1 0 0 1 1 1v5.268l4.562-2.634a1 1 0 1 1 1 1.732L10 8l4.562 2.634a1 1 0 1 1-1 1.732L9 9.732V15a1 1 0 1 1-2 0V9.732l-4.562 2.634a1 1 0 1 1-1-1.732L6 8 1.438 5.366a1 1 0 0 1 1-1.732L7 6.268V1a1 1 0 0 1 1-1"/>
                    </svg>
                </a>
            </label><br>
            <input class="form-control" type="text" name="full_name" id="full_name" placeholder="Иванов Иван Иванович" autocomplete="off" required>

            <label class="form-label" for="birth_day">Дата рождения (число, месяц, год):
                <a href="#" style="text-decoration: none"
                   data-bs-toggle="tooltip" data-bs-placement="top"
                   data-bs-custom-class="custom-tooltip"
                   data-bs-title="Это поле обязательно для заполнения">
                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" style="color: dodgerblue" class="bi bi-asterisk" viewBox="0 0 16 16">
                        <path d="M8 0a1 1 0 0 1 1 1v5.268l4.562-2.634a1 1 0 1 1 1 1.732L10 8l4.562 2.634a1 1 0 1 1-1 1.732L9 9.732V15a1 1 0 1 1-2 0V9.732l-4.562 2.634a1 1 0 1 1-1-1.732L6 8 1.438 5.366a1 1 0 0 1 1-1.732L7 6.268V1a1 1 0 0 1 1-1"/>
                    </svg>
                </a>
            </label><br>
            <input class="form-control" type="date" name="birth_day" id="birth_day" required>

            <label class="form-label" for="gender">Пол (мужской, женский)
                <a href="#" style="text-decoration: none"
                   data-bs-toggle="tooltip" data-bs-placement="top"
                   data-bs-custom-class="custom-tooltip"
                   data-bs-title="Это поле обязательно для заполнения">
                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" style="color: dodgerblue" class="bi bi-asterisk" viewBox="0 0 16 16">
                        <path d="M8 0a1 1 0 0 1 1 1v5.268l4.562-2.634a1 1 0 1 1 1 1.732L10 8l4.562 2.634a1 1 0 1 1-1 1.732L9 9.732V15a1 1 0 1 1-2 0V9.732l-4.562 2.634a1 1 0 1 1-1-1.732L6 8 1.438 5.366a1 1 0 0 1 1-1.732L7 6.268V1a1 1 0 0 1 1-1"/>
                    </svg>
                </a>
            </label><br>
            <select class="form-select" name="gender" id="gender" size="1" required>
                <option selected value="мужской">мужской</option>
                <option value="женский">женский</option>
            </select>

            <label class="form-label" for="password">Серия и номер паспорта или иного документа, удостоверяющего личность (при наличии)</label><br>
            <input class="form-control" type="text" name="password" id="password" oninput="formatPassportInput(this)" maxlength="12" placeholder="XX XX XXXXXX">

            <label class="form-label" for="nationality">Гражданство</label><br>
            <input class="form-control" type="text" id="nationality" name="nationality">
            <div id="suggestions_country"></div>

            <label class="form-label" for="address">Регистрация по месту жительсва</label><br>
            <input class="form-control" type="text" id="address" name="address" autocomplete="off" size="100">
            <div id="suggestions"></div>

            <label class="form-label" for="registration_place_stay">Регистрация по месту пребывания пациента</label><br>
            <div class="input-group">
                <input type="text" class="form-control" name="registration_place_stay" id="registration_place_stay">
                <div class="input-group-append">
                    <button class="btn btn-primary" type="button" onclick="copyText()">Совпадает с местом регистрации</button>
                </div>
            </div>
            <div id="suggestions-stay"></div>

            <label class="form-label" for="number_phone_representative">Номер телефона законного представителя, лица, которому может
                быть передана информация о состоянии здоровья пациента</label>
            <input class="form-control" type="text" id="number_phone_representative" name="number_phone_representative" maxlength="18" placeholder="8 (XXX) XXX XX XX" oninput="formatPhone(this)" autocomplete="off">

            <label class="form-label" for="snils">СНИСЛ (при наличии)</label>
            <input class="form-control" type="text" id="snils" name="snils" maxlength="14" oninput="formatSnils(this)" placeholder="XXX-XXX-XXX XX" autocomplete="off">

            <label class="form-label" for="polis">Полис обязательного медицинского страхования (при наличии)</label>
            <input class="form-control" type="text" id="polis" name="polis" maxlength="16" autocomplete="off" placeholder="XXXXXXXXXXXXXXXX" oninput="this.value = this.value.replace(/[^0-9]/g, '')">

            <label class="form-label" for="delivered">Пациент доставлен (направлен)</label>
            <select class="form-select" name="delivered" id="delivered" size="1">
                <option selected value="полицией">полицией</option>
                <option value="выездной бригадой скорой медицинской помощи">выездной бригадой скорой медицинской помощи</option>
                <option value="другой медицинской организацией">другой медицинской организацией</option>
                <option value="обратился самостоятельно">обратился самостоятельно</option>
            </select>

            <label class="form-label" for="medical_card">Номер медицинской карты</label>
            <input class="form-control" type="text" name="medical_card" id="medical_card" required>

            <label class="form-label" for="medical">Диагноз заболевания (состояния), поставленный направившей медицинской организацией,<br>
                выездной бригадой скорой медицинской помощи (код по МКБ)
                <a href="#" style="text-decoration: none"
                        data-bs-toggle="tooltip" data-bs-placement="top"
                        data-bs-custom-class="custom-tooltip"
                        data-bs-title="Для ввода использовать буквы английского алфавита">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16" style="color: dodgerblue">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
                        <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0"/>
                    </svg>
                </a>
            </label>
            <input class="form-control" type="text" id="medical" name="medical" oninput="toUpperCaseInput(this)">
            <div id="suggestions_medical"></div>

            <label class="form-label" for="cause_injury">Причина и обстоятельства трамвы (в том числе при дорожно-транспортных проишествиях)
                отравления (код по МКБ)
                <a href="#" style="text-decoration: none"
                   data-bs-toggle="tooltip" data-bs-placement="top"
                   data-bs-custom-class="custom-tooltip"
                   data-bs-title="Для ввода использовать буквы английского алфавита">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16" style="color: dodgerblue">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
                        <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0"/>
                    </svg>
                </a>
            </label>
            <input class="form-control" type="text" id="cause_injury" name="cause_injury" oninput="toUpperCaseInput(this)">
            <div id="suggestions_cause"></div>

            <label class="form-label" for="fact_alcohol">Факт употребления алкоголя и иных психоактивных веществ,<br>
                установление наличия или отсутствия признаков состояния опьянения при поступленим пациента<br>
                в медицинскую организацию</label>
            <input class="form-control" type="text" id="fact_alcohol" name="fact_alcohol" autocomplete="off">

            <label class="form-label" for="date_time_alcohol">Дата и время взятия пробы</label>
            <input class="form-control" type="datetime-local" id="date_time_alcohol" name="date_time_alcohol">

            <label class="form-label" for="result_research">Результаты лабораторных исследований</label>
            <input class="form-control" type="text" id="result_research" name="result_research">

            <label class="form-label" for="department_medical_organization">Отделение медицинской организации, в которое направлен пациент</label>
            <input class="form-control" type="text" id="department_medical_organization" name="department_medical_organization" autocomplete="off">

            <label class="form-label" for="outcome_hospitalization">Исход госпитализации</label>
            <select class="form-select" name="outcome_hospitalization" id="outcome_hospitalization" size="1" onchange="toggleMedicalOrgField(this)">
                <option selected value="выписан">выписан</option>
                <option value="переведен в другую медицинскую организацию">переведен в другую медицинскую организацию</option>
                <option value="умер">умер</option>
            </select>

            <label class="form-label" for="date_time_discharge">Дата и время исхода</label>
            <input class="form-control" type="datetime-local" id="date_time_discharge" name="date_time_discharge" autocomplete="off">

            <div id="medicalOrgField">
                <label class="form-label" for="medical_organization_transferred">Наименование медицинской организации, куда переведен пациент</label>
                <input class="form-control" type="text" id="medical_organization_transferred" name="medical_organization_transferred" autocomplete="off">
            </div>

            <label class="form-label" for="date_time_inform"> Дата и время сообщения законному представителю, иному лицу<br>
                или медицинской организации, направившей пациента, о госпитализации (отказе в госпитализации) пациента, ее исходе</label>
            <input class="form-control" type="datetime-local" id="date_time_inform" name="date_time_inform" autocomplete="off">

            <h4> В случае отказа в госпитализации в стационар, дневной стационар</h4>

            <label class="form-label" for="reason_refusal">Причина отказа в гослитализации</label>
            <select class="form-select" name="reason_refusal" id="reason_refusal" size="1">
                <option selected value="отказался пациент">отказался пациент</option>
                <option value="отсутствие показаний">отсутствие показаний</option>
                <option value="помощь оказана в приемном отделении медицинской организации">помощь оказана в приемном отделении медицинской организации</option>
                <option value="направлен в другую медицинскую организацию">направлен в другую медицинскую организацию</option>
                <option value="иная причина">иная причина</option>
            </select>

            <label class="form-label" for="full_name_medical_worker">Фамилия, имя, отчество (при наличии) медицинского работника,
                зафиксировавшего причину отказа в госпитализации</label>
            <input class="form-control" type="text" id="full_name_medical_worker" name="full_name_medical_worker" autocomplete="off" placeholder="Иванов Иван Иванович">

            <label class="form-label" for="additional_information">Дополнительные сведения</label>
            <input class="form-control" type="text" id="additional_information" name="additional_information" autocomplete="off">

            <input type="submit" value="Добавить запись" class="btn btn-primary">

            <hr>

        </form>
    </div>

    <script>

        // после загрузки страницы
        $(function(){
            // инициализации подсказок для всех элементов на странице, имеющих атрибут data-toggle="tooltip"
            $('[data-bs-toggle="tooltip"]').tooltip();
        });

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

        function copyText() {
            const textField1 = document.getElementById("registration_place_stay");
            const textField2 = document.getElementById("address");

            textField1.value = textField2.value;

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

        function formatTimeInput(input) {
            // Убираем все нецифровые символы
            let value = input.value.replace(/\D/g, '');

            // Форматируем строку с добавлением пробелов и точек
            if (value.length >= 4) {
                value = value.slice(0, 2) + ':' + value.slice(2, 5);
            } else if (value.length >= 2) {
                value = value.slice(0, 2) + ':' + value.slice(2);
            }

            // Обновляем значение input
            input.value = value;
        }

        function toUpperCaseInput(input) {

            // Обновляем значение input
            input.value = input.value.replace(/[^0-9a-zA-Z.]/g, '').toUpperCase();
        }

        function toggleMedicalOrgField(selectElement) {
            const medicalOrgField = document.getElementById('medicalOrgField');
            // Проверяем выбрано ли значение "переведен"
            if (selectElement.value === 'переведен в другую медицинскую организацию') {
                medicalOrgField.style.display = 'block'; // Показываем поле
            } else {
                medicalOrgField.style.display = 'none'; // Скрываем поле
            }
        }


    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

</body>
</html>