<#import "blocks/template.ftlh" as t>

<@t.page titlePage="ИЗМЕНЕНИЕ ЗАПИСИ" namePage="editJournal">

<div class="container" style="height: 100vh; width: 100vw; overflow-y: auto; position: relative;">

<#--    <a href="/journal/info/${journal.id}" class="btn btn-primary">-->
<#--        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">-->
<#--            <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>-->
<#--        </svg>-->
<#--        Назад-->
<#--    </a>-->

    <div class="container-fluid pt-4">
        <div class="card bg-dark text-white">
            <div class="card-body">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/" style="padding-right: 14px">Главная</a>></li>
                        <li class="breadcrumb-item"><a href="/journal/info/${journal.id}" style="padding-right: 14px">Просмотр записи</a>></li>
                        <li class="breadcrumb-item active text-white" aria-current="page" style="padding-left: 0">Редактирование записи</li>
                    </ol>
                </nav>
                <h5 class="card-title">Редактирование информации по пациенту <span class="h5" style="color: dodgerblue"> ${journal.full_name}</span></h5>
                <#if journal.dateAddRecord?? && journal.timeAddRecord??>
                    <p class="card-text" style="margin-bottom: 8px">Дата и время создания записи: ${journal.dateAddRecord} ${journal.timeAddRecord}</p>
                </#if>
<#--                <p class="card-text">Выбирите действие, если необходимо <span class="card-text" style="color: dodgerblue">отчистить</span> внесенные изменения или <span class="card-text" style="color: darkgreen">сохранить</span> их.</p>-->
<#--                <a onclick="location.reload()" class="btn btn-primary me-3">-->
<#--                    Отчистить изменения-->
<#--                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-reply-all" viewBox="0 0 16 16">-->
<#--                        <path d="M8.098 5.013a.144.144 0 0 1 .202.134V6.3a.5.5 0 0 0 .5.5c.667 0 2.013.005 3.3.822.984.624 1.99 1.76 2.595 3.876-1.02-.983-2.185-1.516-3.205-1.799a8.74 8.74 0 0 0-1.921-.306 7.404 7.404 0 0 0-.798.008h-.013l-.005.001h-.001L8.8 9.9l-.05-.498a.5.5 0 0 0-.45.498v1.153c0 .108-.11.176-.202.134L4.114 8.254a.502.502 0 0 0-.042-.028.147.147 0 0 1 0-.252.497.497 0 0 0 .042-.028l3.984-2.933zM9.3 10.386c.068 0 .143.003.223.006.434.02 1.034.086 1.7.271 1.326.368 2.896 1.202 3.94 3.08a.5.5 0 0 0 .933-.305c-.464-3.71-1.886-5.662-3.46-6.66-1.245-.79-2.527-.942-3.336-.971v-.66a1.144 1.144 0 0 0-1.767-.96l-3.994 2.94a1.147 1.147 0 0 0 0 1.946l3.994 2.94a1.144 1.144 0 0 0 1.767-.96v-.667z"/>-->
<#--                        <path d="M5.232 4.293a.5.5 0 0 0-.7-.106L.54 7.127a1.147 1.147 0 0 0 0 1.946l3.994 2.94a.5.5 0 1 0 .593-.805L1.114 8.254a.503.503 0 0 0-.042-.028.147.147 0 0 1 0-.252.5.5 0 0 0 .042-.028l4.012-2.954a.5.5 0 0 0 .106-.699z"/>-->
<#--                    </svg>-->
<#--                </a>-->
<#--                <button type="submit" class="btn btn-success">-->
<#--                    Применить изменения-->
<#--                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">-->
<#--                        <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>-->
<#--                    </svg>-->
<#--                </button>-->
            </div>
        </div>
    </div>

    <span class="d-flex text-dark justify-content-center" style="padding: 20px 0 20px 0; font-weight: bold">
        <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-vector-pen" viewBox="0 0 16 16">
          <path fill-rule="evenodd" d="M10.646.646a.5.5 0 0 1 .708 0l4 4a.5.5 0 0 1 0 .708l-1.902 1.902-.829 3.313a1.5 1.5 0 0 1-1.024 1.073L1.254 14.746 4.358 4.4A1.5 1.5 0 0 1 5.43 3.377l3.313-.828L10.646.646zm-1.8 2.908-3.173.793a.5.5 0 0 0-.358.342l-2.57 8.565 8.567-2.57a.5.5 0 0 0 .34-.357l.794-3.174-3.6-3.6z"/>
          <path fill-rule="evenodd" d="M2.832 13.228 8 9a1 1 0 1 0-1-1l-4.228 5.168-.026.086.086-.026z"/>
        </svg>
    </span>

    <div class="container text-white blurBG" style="justify-content: center; width: 50vw; border-radius: 7px">
        <h4 style="padding-top: 16px">Редактирование записи</h4>
        <hr>

        <form action="/journal/save/edit/${journal.id}" method="post" autocomplete="off" style="padding: 10px; margin-bottom: 20px">
            <button type="submit" hidden="hidden" id="btnSaveEdit"></button>
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
            <input class="form-control mb-4" type="date" name="date_receipt" id="date_receipt" <#if journal.date_receipt??>value="${journal.date_receipt}"</#if> required>

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
            <input class="form-control mb-4" type="time" name="string_time_receipt" id="string_time_receipt" <#if journal.string_time_receipt??>value="${journal.string_time_receipt}"</#if> required>

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
            <input class="form-control mb-4" type="text" name="full_name" id="full_name" placeholder="Иванов Иван Иванович" autocomplete="off" <#if journal.full_name??>value="${journal.full_name}"</#if> required>

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
            <input class="form-control mb-4" type="date" name="birth_day" id="birth_day" <#if journal.birth_day??>value="${journal.birth_day}"</#if> required>

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
            <select class="form-select mb-4" name="gender" id="gender" size="1" required>
                <option value="" style="font-weight: bold">Пожалуйста, сделайте выбор</option>
                <#list optionsGender as option>
                    <option value="${option}" <#if journal.gender == option>selected</#if>>${option}</option>
                </#list>
            </select>

            <label class="form-label" for="password">Серия и номер паспорта или иного документа, удостоверяющего личность (при наличии)</label><br>
            <input class="form-control mb-4" type="text" name="password" id="password" oninput="formatPassportInput(this)" maxlength="12" placeholder="XX XX XXXXXX" <#if journal.password??>value="${journal.password}"</#if>>

            <label class="form-label" for="nationality">Гражданство</label><br>
            <input class="form-control mb-4" type="text" id="nationality" name="nationality" <#if journal.nationality??>value="${journal.nationality}"</#if>>
            <div id="suggestions_country"></div>

            <label class="form-label" for="address">Регистрация по месту жительсва</label><br>
            <input class="form-control mb-4" type="text" id="address" name="address" autocomplete="off" size="100" <#if journal.address??>value="${journal.address}"</#if>>
            <div id="suggestions"></div>

            <label class="form-label" for="registration_place_stay">Регистрация по месту пребывания пациента</label><br>
            <input type="text" class="form-control" name="registration_place_stay" id="registration_place_stay" <#if journal.registration_place_stay??>value="${journal.registration_place_stay}"</#if>>
<#--            <div class="input-group mb-4">-->
<#--&lt;#&ndash;                <input type="text" class="form-control" name="registration_place_stay" id="registration_place_stay" <#if journal.registration_place_stay??>value="${journal.registration_place_stay}"</#if>>&ndash;&gt;-->
<#--&lt;#&ndash;                <div class="input-group-append">&ndash;&gt;-->
<#--&lt;#&ndash;                    <button class="btn btn-primary" type="button" onclick="copyText()">Совпадает с местом регистрации</button>&ndash;&gt;-->
<#--&lt;#&ndash;                </div>&ndash;&gt;-->
<#--            </div>-->
            <div id="suggestions-stay" style="margin-top: 0"></div>
            <label class="mb-4">
                <input type="checkbox" class="custom-checkbox" value="Совпадает с местом регистрации" onclick="copyText()">
                Совпадает с местом регистрации
            </label>

            <label class="form-label" for="number_phone_representative">Номер телефона законного представителя, лица, которому может
                быть передана информация о состоянии здоровья пациента</label>
            <input class="form-control mb-4" type="text" id="number_phone_representative" name="number_phone_representative" maxlength="18" placeholder="8 (XXX) XXX XX XX" oninput="formatPhone(this)" autocomplete="off" <#if journal.number_phone_representative??>value="${journal.number_phone_representative}"</#if>>

            <label class="form-label" for="snils">СНИСЛ (при наличии)</label>
            <input class="form-control mb-4" type="text" id="snils" name="snils" maxlength="14" oninput="formatSnils(this)" placeholder="XXX-XXX-XXX XX" autocomplete="off" <#if journal.snils??>value="${journal.snils}"</#if>>

            <label class="form-label" for="polis">Полис обязательного медицинского страхования (при наличии)</label>
            <input class="form-control mb-4" type="text" id="polis" name="polis" maxlength="16" autocomplete="off" placeholder="XXXXXXXXXXXXXXXX" oninput="this.value = this.value.replace(/[^0-9]/g, '')" <#if journal.polis??>value="${journal.polis}"</#if>>

            <label class="form-label" for="delivered">Пациент доставлен (направлен)</label>
            <select class="form-select mb-4" name="delivered" id="delivered" size="1">
                <option value="" style="font-weight: bold">Пожалуйста, сделайте выбор</option>
                <#list optionsDelivered as option>
                    <option value="${option}" <#if journal.delivered == option>selected</#if>>${option}</option>
                </#list>
            </select>

            <label class="form-label" for="medical_card">Номер медицинской карты
                <a href="#" style="text-decoration: none"
                   data-bs-toggle="tooltip" data-bs-placement="top"
                   data-bs-custom-class="custom-tooltip"
                   data-bs-title="Это поле обязательно для заполнения">
                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" style="color: dodgerblue" class="bi bi-asterisk" viewBox="0 0 16 16">
                        <path d="M8 0a1 1 0 0 1 1 1v5.268l4.562-2.634a1 1 0 1 1 1 1.732L10 8l4.562 2.634a1 1 0 1 1-1 1.732L9 9.732V15a1 1 0 1 1-2 0V9.732l-4.562 2.634a1 1 0 1 1-1-1.732L6 8 1.438 5.366a1 1 0 0 1 1-1.732L7 6.268V1a1 1 0 0 1 1-1"/>
                    </svg>
                </a>
            </label><br>
            <input class="form-control mb-4" type="text" name="medical_card" id="medical_card" required <#if journal.medical_card??>value="${journal.medical_card}"</#if>>

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
            <input class="form-control mb-4" type="text" id="medical" name="medical" oninput="toUpperCaseInput(this)" <#if journal.medical??>value="${journal.medical}"</#if>>
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
            <input class="form-control mb-4" type="text" id="cause_injury" name="cause_injury" oninput="toUpperCaseInput(this)" <#if journal.cause_injury??>value="${journal.cause_injury}"</#if>>
            <div id="suggestions_cause"></div>

            <label class="form-label" for="fact_alcohol">Факт употребления алкоголя и иных психоактивных веществ,<br>
                установление наличия или отсутствия признаков состояния опьянения при поступленим пациента<br>
                в медицинскую организацию</label>
            <input class="form-control mb-4" type="text" id="fact_alcohol" name="fact_alcohol" autocomplete="off" <#if journal.fact_alcohol??>value="${journal.fact_alcohol}"</#if>>

            <label class="form-label" for="date_time_alcohol">Дата и время взятия пробы</label>
            <input class="form-control mb-4" type="datetime-local" id="date_time_alcohol" name="date_time_alcohol" <#if journal.date_time_alcohol??>value="${journal.date_time_alcohol}"</#if>>

            <label class="form-label" for="result_research">Результаты лабораторных исследований</label>
            <input class="form-control mb-4" type="text" id="result_research" name="result_research" <#if journal.result_research??>value="${journal.result_research}"</#if>>

            <label class="form-label" for="department_medical_organization">Отделение медицинской организации, в которое направлен пациент</label>
            <input class="form-control mb-4" type="text" id="department_medical_organization" name="department_medical_organization" autocomplete="off" <#if journal.department_medical_organization??>value="${journal.department_medical_organization}"</#if>>

            <label class="form-label" for="outcome_hospitalization">Исход госпитализации</label>
            <select class="form-select mb-4" name="outcome_hospitalization" id="outcome_hospitalization" size="1" onchange="toggleMedicalOrgField()">
                <option value="" style="font-weight: bold">Пожалуйста, сделайте выбор</option>
                <#list options as option>
                    <option value="${option}"<#if journal.outcome_hospitalization == option> selected </#if>>${option}</option>
                </#list>
            </select>

            <label class="form-label" for="date_time_discharge">Дата и время исхода</label>
            <input class="form-control mb-4" type="datetime-local" id="date_time_discharge" name="date_time_discharge" autocomplete="off" <#if journal.local_date_time_discharge??>value="${journal.local_date_time_discharge}"</#if>>

            <div id="medicalOrgField">
                <label class="form-label" for="medical_organization_transferred">Наименование медицинской организации, куда переведен пациент</label>
                <input class="form-control mb-4" type="text" id="medical_organization_transferred" name="medical_organization_transferred" autocomplete="off" <#if journal.medical_organization_transferred??>value="${journal.medical_organization_transferred}"</#if>>
            </div>

            <label class="form-label" for="date_time_inform"> Дата и время сообщения законному представителю, иному лицу<br>
                или медицинской организации, направившей пациента, о госпитализации (отказе в госпитализации) пациента, ее исходе</label>
            <input class="form-control mb-4" type="datetime-local" id="date_time_inform" name="date_time_inform" autocomplete="off" <#if journal.date_time_inform??>value="${journal.date_time_inform}"</#if>>

            <h4> В случае отказа в госпитализации в стационар, дневной стационар</h4>

            <label class="form-label" for="reason_refusal">Причина отказа в гослитализации</label>
            <select class="form-select mb-4" name="reason_refusal" id="reason_refusal" size="1" <#if journal.reason_refusal??>value="${journal.reason_refusal}"</#if>>
                <option value="" style="font-weight: bold">Пожалуйста, сделайте выбор</option>
                <#list optionsReason as option>
                    <option value="${option}" <#if journal.reason_refusal == option>selected</#if>>${option}</option>
                </#list>
            </select>

            <label class="form-label" for="full_name_medical_worker">Фамилия, имя, отчество (при наличии) медицинского работника,
                зафиксировавшего причину отказа в госпитализации</label>
            <input class="form-control mb-4" type="text" id="full_name_medical_worker" name="full_name_medical_worker" autocomplete="off" placeholder="Иванов Иван Иванович" <#if journal.full_name_medical_worker??>value="${journal.full_name_medical_worker}"</#if>>

            <label class="form-label" for="additional_information">Дополнительные сведения</label>
            <input class="form-control mb-4" type="text" id="additional_information" name="additional_information" autocomplete="off" <#if journal.additional_information??>value="${journal.additional_information}"</#if>>
        </form>
    </div>
</div>

</@t.page>


