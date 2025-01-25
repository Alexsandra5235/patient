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
    <a href="/journal/save">Добавить запись</a>
    <br><br>



    <form method="get" action="/export/excel">
        <label>С <input type="date" name="data1"></label>
        <label>До <input type="date" name="data2"></label>

        <button type="submit">Экспортировать в Excel</button>
    </form>

</body>
</html>