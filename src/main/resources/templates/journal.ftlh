<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JOURNAL</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        #suggestions {
            border: 1px solid #ccc;
            max-height: 150px;
            overflow-y: auto;
            display: none; /* Скрываем изначально */
        }
        .suggestion-item {
            padding: 8px;
            cursor: pointer;
        }
        .suggestion-item:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
    <h3 align="center">ЖУРНАЛ УЧЕТА ПРИЕМА ПАЦИЕНТОВ И ОТКАЗОВ В ОКАЗАНИИ МЕДИЦИНСКОЙ ПОМОЩИ<br>
        В СТАЦИОНАРНЫХ УСЛОВИЯХ, В УСЛОВИЯХ ДНЕВНОГО СТАЦИОНАРА</h3>

    <hr>
    <form action="/" method="get">
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
    <form action="/journal/save" method="post" >
        <h4>Добавление записи</h4>
        <hr>
        <label>Дата поступления: <input type="date" name="date_receipt" value="${date_now}"></label><br><br>
        <label>время поступления: <input type="text" name="string_time_receipt" value="${time_now}"></label><br><br>
        <label>ФИО: <input type="text" name="full_name"></label><br><br>
        <label>Дата рождения: <input type="date" name="birth_day"></label><br><br>
        <label>Пол: <select name="gender" size="1">
                        <option selected value="m">мужской</option>
                        <option value="j">женский</option>
                    </select>
        </label><br><br>
        <input type="submit" value="Добавить запись"><br>
        <hr>
    </form>

    <form id="dataForm">
        <label for="address">Введите адрес:</label>
        <input type="text" id="address" name="address" autocomplete="off" size="100">
        <div id="suggestions"></div>
        <button type="submit">Отправить</button>
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
                $('#address').val($(this).text());
                $('#suggestions').hide();

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