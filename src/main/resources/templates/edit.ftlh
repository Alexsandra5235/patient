<!DOCTYPE html>
<html lang="ru">
<head>
    <title>JOURNAL</title>
</head>
<body>

    <form action="/journal/save/edit/${journal.id}" method="post">
        <label>Дата послупления: <input type="date" name="date_receipt" <#if journal.date_receipt??>value="${journal.date_receipt}"</#if> ></label><br><br>
        <label>Время послупления: <input type="text" name="time_receipt" <#if journal.time_receipt??>value="${journal.time_receipt}"</#if>></label><br><br>
        <label>ФИО: <input type="text" name="full_name" <#if journal.full_name??>value="${journal.full_name}"</#if>></label><br><br>
        <label>Дата рождения: <input type="date" name="birth_day" <#if journal.birth_day??>value="${journal.birth_day}"</#if>></label><br><br>
        <hr>
        <input type="submit" value="Сохранить">
    </form>
    <hr>
    <form action="/journal/delete/${journal.id}" method="post">
        <input type="submit" value="Удалить запись">
    </form>
</body>
</html>