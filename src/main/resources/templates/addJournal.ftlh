<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JOURNAL</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        #suggestions, #suggestions_country, #suggestions-stay, #suggestions_medical,
        #suggestions_cause{
            border: 1px solid #ccc;
            max-height: 150px;
            overflow-y: auto;
            display: none; /* Скрываем изначально */
        }
        .suggestion-item, .suggestion-item-country, .suggestion-item-stay, .suggestion-item-medical,
        .suggestion-item-cause{
            padding: 8px;
            cursor: pointer;
        }
        .suggestion-item, .suggestion-item-country, .suggestion-item-stay, .suggestion-item-medical,
        .suggestion-item-cause:hover {
            background-color: #f0f0f0;
        }

        #medicalOrgField {
            display: none; /* Скрываем поле по умолчанию */
        }
    </style>
</head>
<body>
    <h3 align="center">ЖУРНАЛ УЧЕТА ПРИЕМА ПАЦИЕНТОВ И ОТКАЗОВ В ОКАЗАНИИ МЕДИЦИНСКОЙ ПОМОЩИ<br>
        В СТАЦИОНАРНЫХ УСЛОВИЯХ, В УСЛОВИЯХ ДНЕВНОГО СТАЦИОНАРА</h3>
    <form action="/journal/add" method="post" autocomplete="off">
        <h4>Добавление записи</h4>
        <hr>
        <label>Дата поступления: <input type="date" name="date_receipt" value="${date_now}"></label><br><br>
        <label>Время поступления: <input type="text" name="string_time_receipt" maxlength="5" value="${time_now}" oninput="formatTimeInput(this)"></label><br><br>
        <label>Фамилия, имя, отчестов (при наличии): <input type="text" name="full_name" placeholder="Иванов Иван Иванович" autocomplete="off"></label><br><br>
        <label>Дата рождения (число, месяц, год): <input type="date" name="birth_day"></label><br><br>
        <label>Пол (мужской, женский): <select name="gender" size="1">
                <option selected value="мужской">мужской</option>
                <option value="женский">женский</option>
            </select>
        </label><br><br>
        <label>Серия и номер паспорта или иного документа, удостоверяющего личность (при наличии):
            <input type="text" name="password" oninput="formatPassportInput(this)"
                   maxlength="12" placeholder="12 34 567890">
        </label><br><br>
        <label for="nationality">Гражданство:</label>
        <input type="text" id="nationality" name="nationality">
        <div id="suggestions_country"></div>
        <br><br>
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
        <label for="number_phone_representative">Номер телефона законного представителя, лица, которому может
            быть передана информация о состоянии здоровья пациента:</label>
        <input type="text" id="number_phone_representative" name="number_phone_representative" maxlength="18" oninput="formatPhone(this)" autocomplete="off">
        <br><br>
        <label for="snils">СНИСЛ (при наличии):</label>
        <input type="text" id="snils" name="snils" maxlength="14" oninput="formatSnils(this)" autocomplete="off">
        <br><br>
        <label for="polis">Полис обязательного медицинского страхования (при наличии):</label>
        <input type="text" id="polis" name="polis" maxlength="16" autocomplete="off" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
        <br><br>
        <label>Пациент доставлен (направлен): <select name="delivered" size="1">
                <option selected value="полицией">полицией</option>
                <option value="выездной бригадой скорой медицинской помощи">выездной бригадой скорой медицинской помощи</option>
                <option value="другой медицинской организацией">другой медицинской организацией</option>
                <option value="обратился самостоятельно">обратился самостоятельно</option>
            </select>
        </label><br><br>
        <label>Номер медицинской карты: <input type="text" name="medical_card"></label><br><br>

        <label for="medical">Диагноз заболевания (состояния), поставленный направившей медицинской организацией,<br>
            выездной бригадой скорой медицинской помощи (код по МКБ)
        </label>
        <input type="text" id="medical" name="medical" oninput="toUpperCaseInput(this)">
        <small>Только буквы английского алфавита</small>
        <div id="suggestions_medical"></div>
        <br><br>
        <label for="cause_injury">Причина и обстоятельства трамвы (в том числе при дорожно-транспортных проишествиях)
            отравления (код по МКБ)
        </label>
        <input type="text" id="cause_injury" name="cause_injury" oninput="toUpperCaseInput(this)">
        <small>Только буквы английского алфавита</small>
        <div id="suggestions_cause"></div>
        <br><br>
        <label for="fact_alcohol">Факт употребления алкоголя и иных психоактивных веществ,<br>
            установление наличия или отсутствия признаков состояния опьянения при поступленим пациента<br>
            в медицинскую организацию:</label>
        <input type="text" id="fact_alcohol" name="fact_alcohol" autocomplete="off">
        <br><br>
        <label for="date_time_alcohol">Дата и время взятия пробы:</label>
        <input type="datetime-local" id="date_time_alcohol" name="date_time_alcohol">
        <br><br>
        <label for="result_research">Результаты лабораторных исследований:</label>
        <input type="text" id="result_research" name="result_research">
        <br><br>
        <label for="department_medical_organization">Отделение медицинской организации, в которое направлен пациент:</label>
        <input type="text" id="department_medical_organization" name="department_medical_organization" autocomplete="off">
        <br><br>
        <label>Исход госпитализации:
            <select name="outcome_hospitalization" size="1" onchange="toggleMedicalOrgField(this)">
                <option selected value="выписан">выписан</option>
                <option value="переведен в другую медицинскую организацию">переведен в другую медицинскую организацию</option>
                <option value="умер">умер</option>
            </select>
        </label>
        <br><br>
        <label for="date_time_discharge">Дата и время исхода:</label>
        <input type="datetime-local" id="date_time_discharge" name="date_time_discharge" autocomplete="off">


        <br><br>

        <div id="medicalOrgField">
            <label for="medical_organization_transferred">Наименование медицинской организации, куда переведен пациент:</label>
            <input type="text" id="medical_organization_transferred" name="medical_organization_transferred" autocomplete="off">
        </div>

        <br><br>
        <label for="date_time_inform"> Дата и время сообщения законному представителю, иному лицу<br>
            или медицинской организации, направившей пациента, о госпитализации (отказе в госпитализации) пациента, ее исходе: </label>
        <input type="datetime-local" id="date_time_inform" name="date_time_inform" autocomplete="off">

        <br><br>

        <label> В случае отказа в госпитализации в стационар, дневной стационар: </label>

        <br><br>

        <label for="reason_refusals">Причина отказа в гослитализации:
            <select name="reason_refusal" size="1">

                <option selected value="отказался пациент">отказался пациент</option>

                <option value="отсутствие показаний">отсутствие показаний</option>

                <option value="помощь оказана в приемном отделении медицинской организации">помощь оказана в приемном отделении медицинской организации</option>

                <option value="направлен в другую медицинскую организацию">направлен в другую медицинскую организацию</option>

                <option value="иная причина">иная причина</option>

            </select>
        </label>
        <br><br>
        <label for="full_name_medical_worker">Фамилия, имя, отчество (при наличии) медицинского работника,
            зафиксировавшего причину отказа в госпитализации:</label>
        <input type="text" id="full_name_medical_worker" name="full_name_medical_worker" autocomplete="off" placeholder="Иванов Иван Иванович">
        <br><br>
        <label for="additional_information">Дополнительные сведения:</label>
        <input type="text" id="additional_information" name="additional_information" autocomplete="off">
        <br><br>

        <input type="submit" value="Добавить запись">
        <br>


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

                input.focus();
                input.setSelectionRange(input.value.length, input.value.length);

                const originalString = $(this).text();
                const trimmedString = originalString.split(' - ')[0];
                $('#medical').val(trimmedString);
                $('#suggestions_medical').hide();



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

                // Управление положением курсора
                const input = document.getElementById('medical').value.length;

                input.focus();
                input.setSelectionRange(input.value.length, input.value.length);

                const originalString = $(this).text();
                const trimmedString = originalString.split(' - ')[0];
                $('#cause_injury').val(trimmedString);
                $('#suggestions_cause').hide();



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
</body>
</html>