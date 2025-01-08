<!DOCTYPE html>
<html lang="ru">
<head>
    <title>JOURNAL</title>
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
        <input type="submit" value="Добавить запись"><br>
        <hr>
    </form>

    <form method="get" action="/export/excel">
        <label>С <input type="date" name="data1"></label>
        <label>До <input type="date" name="data2"></label>

        <button type="submit">Экспортировать в Excel</button>
    </form>

</body>
</html>