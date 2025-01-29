<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JOURNAL</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
    <body>

    <#list dates as data>
        <p>${data}</p>
        <#list times as time>
            <p>${time}</p>
            <#list reports as report>
                <#if report.createdAt.toLocalDate() == data && report.createdAt.toLocalTime() == time>
                    <a href="/journal/report/get/${report.id}">${report.fileName}</a>
                </#if>

            </#list>
        </#list>
    </#list>
    <br>

<#--    <#list reports as report>-->
<#--        <p>${report.createdAt}</p>-->
<#--        <a href="/journal/report/get/${report.id}">${report.fileName}</a>-->
<#--    </#list>-->
    </body>
</html>