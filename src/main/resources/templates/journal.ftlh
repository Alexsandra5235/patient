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

    <table style="border: 1px">
        <tr>
            <th rowspan="2">Редактирование</th>
            <th rowspan="2">Дата послупления</th>
            <th rowspan="2">Время послупления</th>
            <th rowspan="2">Фамилия, имя, отчестов (при наличии)</th>
            <th rowspan="2">Дата рождения (число, месяц, год)</th>
            <th rowspan="2">Пол (мужской, женский)</th>
            <th rowspan="2">Серия и номер паспорта или иного документа, удостоверяющего личность (при наличии)</th>
            <th rowspan="2">Гражданство</th>
            <th rowspan="2">Регистрация по месту жительсва</th>
            <th rowspan="2">Регистрация по месту пребывания пациента, номер телефона законного представителя, лица, которому может быть передана информация о состоянии здоровья пациента</th>
            <th rowspan="2">СНИСЛ (при наличии)</th>
            <th rowspan="2">Полис обязательного медицинского страхования (при наличии)</th>
            <th rowspan="2">Пациент доставлен (направлен)</th>
            <th rowspan="2">Номер медицинской карты</th>
            <th rowspan="2">Диагноз заболевания (состояния), поставленный направившей медицинской организацией, выездной бригадой скорой медицинской помощи (код по МКБ)</th>
            <th rowspan="2">Причина и обстоятельства трамвы (в том числе при дорожно-транспортных проишествиях) отравления (код по МКБ)</th>
            <th rowspan="2">Факт употребления алкоголя и иных психоактивных веществ, установление наличия или отсутствия признаков состояния опьянения при поступленим пациента в медицинскую организацию, дата и время взятия пробы, результаты лабораторных исследований</th>
            <th rowspan="2">Отделение медицинской организации, в которое направлен пациент</th>
            <th rowspan="2">Исход госпитализации, дата и время исхода, наименование медицинской организации, куда переведен пациент</th>
            <th rowspan="2">Дата и время сообщения законному представителю, иному лицу или медицинской организации, направившей пациента, о госпитализации (отказе в госпитализации) пациента, ее исходе</th>
            <th colspan="2">В случае отказа в госпитализации в стационар, дневной стационар</th>
            <th rowspan="2">Дополнительные сведения</th>
        </tr>
        <tr>
            <th>Причина отказа в гослитализации</th>
            <th>Фамилия, имя, отчество (при наличии) медицинского работника, зафиксировавшего причину отказа в госпитализации</th>
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
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
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