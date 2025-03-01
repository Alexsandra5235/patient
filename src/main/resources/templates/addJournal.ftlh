<#import "blocks/template.ftlh" as t>

<@t.page titlePage="ДОБАВЛЕНИЕ ЗАПИСИ">



<#--        <div class="edit-header container-fluid py-4">-->
<#--            <div class="card">-->
<#--                <div class="card-body">-->
<#--                    <h5 class="card-title">Добавление новой записи</h5>-->
<#--                    <p class="card-text">Выбирите действие, если необходимо <span class="card-text" style="color: darkgreen">добавить</span> новую запись в журнал учета.</p>-->
<#--                    <button type="submit" class="btn btn-success">-->
<#--                        Добавить запись-->
<#--                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">-->
<#--                            <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>-->
<#--                            <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>-->
<#--                        </svg>-->
<#--                    </button>-->
<#--                </div>-->
<#--            </div>-->
<#--        </div>-->

    <div class="container text-left" style="overflow-y: auto; height: 100vh; position: relative;">
        <form action="/journal/add" method="post" autocomplete="off">
            <div class="card bg-dark text-white sticky-top" style="padding: 7px; margin-bottom: 10px">
                <h4>Добавление записи</h4>
                <hr>
                <p class="card-text">Выбирите действие, если необходимо <span class="card-text" style="color: darkgreen">добавить</span> новую запись в журнал учета.</p>
                <button type="submit" class="btn btn-success">
                    Добавить запись
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
                        <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                        <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
                    </svg>
                </button>
            </div>

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
            <input class="form-control mb-4" type="date" name="date_receipt" id="date_receipt" value="${date_now}" required>

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
            <input class="form-control mb-4" type="time" name="string_time_receipt" id="string_time_receipt" maxlength="5" value="${time_now}" required>

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
            <input class="form-control mb-4" type="text" name="full_name" id="full_name" placeholder="Иванов Иван Иванович" autocomplete="off" required>

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
            <input class="form-control mb-4" type="date" name="birth_day" id="birth_day" required>

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
                    <option value="${option}">${option}</option>
                </#list>
            </select>

            <label class="form-label" for="password">Серия и номер паспорта или иного документа, удостоверяющего личность (при наличии)</label><br>
            <input class="form-control mb-4" type="text" name="password" id="password" oninput="formatPassportInput(this)" maxlength="12" placeholder="XX XX XXXXXX">

            <label class="form-label" for="nationality">Гражданство</label><br>
            <input class="form-control mb-4" type="text" id="nationality" name="nationality">
            <div id="suggestions_country"></div>

            <label class="form-label" for="address">Регистрация по месту жительсва</label><br>
            <input class="form-control mb-4" type="text" id="address" name="address" autocomplete="off" size="100">
            <div id="suggestions"></div>

            <label class="form-label" for="registration_place_stay">Регистрация по месту пребывания пациента</label><br>
            <div class="input-group mb-4">
                <input type="text" class="form-control" name="registration_place_stay" id="registration_place_stay">
                <div class="input-group-append">
                    <button class="btn btn-primary" type="button" onclick="copyText()">Совпадает с местом регистрации</button>
                </div>
            </div>
            <div id="suggestions-stay"></div>

            <label class="form-label" for="number_phone_representative">Номер телефона законного представителя, лица, которому может
                быть передана информация о состоянии здоровья пациента</label>
            <input class="form-control mb-4" type="text" id="number_phone_representative" name="number_phone_representative" maxlength="18" placeholder="8 (XXX) XXX XX XX" oninput="formatPhone(this)" autocomplete="off">

            <label class="form-label" for="snils">СНИСЛ (при наличии)</label>
            <input class="form-control mb-4" type="text" id="snils" name="snils" maxlength="14" oninput="formatSnils(this)" placeholder="XXX-XXX-XXX XX" autocomplete="off">

            <label class="form-label" for="polis">Полис обязательного медицинского страхования (при наличии)</label>
            <input class="form-control mb-4" type="text" id="polis" name="polis" maxlength="16" autocomplete="off" placeholder="XXXXXXXXXXXXXXXX" oninput="this.value = this.value.replace(/[^0-9]/g, '')">

            <label class="form-label" for="delivered">Пациент доставлен (направлен)</label>
            <select class="form-select mb-4" name="delivered" id="delivered" size="1">
                <option value="" style="font-weight: bold">Пожалуйста, сделайте выбор</option>
                <#list optionsDelivered as option>
                    <option value="${option}">${option}</option>
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
            <input class="form-control mb-4" type="text" name="medical_card" id="medical_card" required>

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
            <input class="form-control mb-4" type="text" id="medical" name="medical" oninput="toUpperCaseInput(this)">
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
            <input class="form-control mb-4" type="text" id="cause_injury" name="cause_injury" oninput="toUpperCaseInput(this)">
            <div id="suggestions_cause"></div>

            <label class="form-label" for="fact_alcohol">Факт употребления алкоголя и иных психоактивных веществ,<br>
                установление наличия или отсутствия признаков состояния опьянения при поступленим пациента<br>
                в медицинскую организацию</label>
            <input class="form-control mb-4" type="text" id="fact_alcohol" name="fact_alcohol" autocomplete="off">

            <label class="form-label" for="date_time_alcohol">Дата и время взятия пробы</label>
            <input class="form-control mb-4" type="datetime-local" id="date_time_alcohol" name="date_time_alcohol">

            <label class="form-label" for="result_research">Результаты лабораторных исследований</label>
            <input class="form-control mb-4" type="text" id="result_research" name="result_research">

            <label class="form-label" for="department_medical_organization">Отделение медицинской организации, в которое направлен пациент</label>
            <input class="form-control mb-4" type="text" id="department_medical_organization" name="department_medical_organization" autocomplete="off">

            <label class="form-label" for="outcome_hospitalization">Исход госпитализации</label>
            <select class="form-select mb-4" name="outcome_hospitalization" id="outcome_hospitalization" size="1" onchange="toggleMedicalOrgField(this)">
                <option value="" style="font-weight: bold">Пожалуйста, сделайте выбор</option>
                <#list options as option>
                    <option value="${option}">${option}</option>
                </#list>
            </select>

            <label class="form-label" for="date_time_discharge">Дата и время исхода</label>
            <input class="form-control mb-4" type="datetime-local" id="date_time_discharge" name="date_time_discharge" autocomplete="off">

            <div id="medicalOrgField">
                <label class="form-label" for="medical_organization_transferred">Наименование медицинской организации, куда переведен пациент</label>
                <input class="form-control mb-4" type="text" id="medical_organization_transferred" name="medical_organization_transferred" autocomplete="off">
            </div>

            <label class="form-label" for="date_time_inform"> Дата и время сообщения законному представителю, иному лицу<br>
                или медицинской организации, направившей пациента, о госпитализации (отказе в госпитализации) пациента, ее исходе</label>
            <input class="form-control mb-4" type="datetime-local" id="date_time_inform" name="date_time_inform" autocomplete="off">

            <h4> В случае отказа в госпитализации в стационар, дневной стационар</h4>

            <label class="form-label" for="reason_refusal">Причина отказа в гослитализации</label>
            <select class="form-select mb-4" name="reason_refusal" id="reason_refusal" size="1">
                <option value="" selected style="font-weight: bold"> Пожалуйста, сделайте выбор...</option>
                <#list optionsReason as option>
                    <option value="${option}">${option}</option>
                </#list>
            </select>

            <label class="form-label" for="full_name_medical_worker">Фамилия, имя, отчество (при наличии) медицинского работника,
                зафиксировавшего причину отказа в госпитализации</label>
            <input class="form-control mb-4" type="text" id="full_name_medical_worker" name="full_name_medical_worker" autocomplete="off" placeholder="Иванов Иван Иванович">

            <label class="form-label" for="additional_information">Дополнительные сведения</label>
            <input class="form-control mb-4" type="text" id="additional_information" name="additional_information" autocomplete="off">
            </form>
        </div>



</@t.page>


