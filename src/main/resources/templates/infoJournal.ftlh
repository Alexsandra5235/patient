<#import "blocks/template.ftlh" as t>

<@t.page>

    <div class="alert-primary" id="scrollToTop">
        <a href="#" style="text-decoration: none">
            <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-arrow-up-circle" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
            </svg>
        </a>
    </div>

    <div class="edit-header container-fluid py-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Полная информация по пациенту<span class="h5" style="color: dodgerblue"> ${journal.full_name}</span></h5>
                <p class="card-text">На этой странице отображаются все данные по пациенту. Выбирите действие, если необходимо удалить или редактировать информацию по пациенту.</p>
                <div class="btn-group" role="group">
                    <form action="/journal/edit/${journal.id}" method="get">
                        <button class="btn btn-outline-primary mx-4">Редактировать запись</button>
                    </form>

                    <form action="/journal/delete/${journal.id}" method="post">
                        <button class="btn btn-outline-danger" id="liveToastBtn">Удалить запись</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <fieldset disabled>
        <div class="container text-left">
            <h4>Полная информация</h4>
            <hr>

            <label class="form-label" for="date_receipt">Дата поступления</label><br>
            <input class="form-control mb-4" id="date_receipt" type="date" <#if journal.date_receipt??>value="${journal.date_receipt}"</#if>>

            <label class="form-label" for="string_time_receipt">Время поступления</label><br>
            <input class="form-control mb-4" type="time" id="string_time_receipt" <#if journal.string_time_receipt??>value="${journal.string_time_receipt}"</#if>>

            <label class="form-label" for="full_name">Фамилия, имя, отчестов (при наличии)</label><br>
            <input class="form-control mb-4" type="text" id="full_name" <#if journal.full_name??>value="${journal.full_name}"</#if>>

            <label class="form-label" for="birth_day">Дата рождения (число, месяц, год):</label><br>
            <input class="form-control mb-4" type="date" id="birth_day" <#if journal.birth_day??>value="${journal.birth_day}"</#if>>

            <label class="form-label" for="gender">Пол (мужской, женский)</label><br>
            <input class="form-select mb-4" type="text" id="gender" <#if journal.gender??>value="${journal.gender}"</#if>>

            <label class="form-label" for="password">Серия и номер паспорта или иного документа, удостоверяющего личность (при наличии)</label><br>
            <input class="form-control mb-4" type="text" id="password" <#if journal.password??>value="${journal.password}"</#if>>

            <label class="form-label" for="nationality">Гражданство</label><br>
            <input class="form-control mb-4" type="text" id="nationality" <#if journal.nationality??>value="${journal.nationality}"</#if>>

            <label class="form-label" for="address">Регистрация по месту жительсва</label><br>
            <input class="form-control mb-4" type="text" id="address" size="300" <#if journal.address??> value="${journal.address}"</#if>>

            <label class="form-label" for="registration_place_stay">Регистрация по месту пребывания пациента</label><br>
            <input type="text" class="form-control mb-4" id="registration_place_stay" size="300" <#if journal.registration_place_stay??>value="${journal.registration_place_stay}"</#if>>

            <label class="form-label" for="number_phone_representative">Номер телефона законного представителя, лица, которому может
                быть передана информация о состоянии здоровья пациента</label>
            <input class="form-control mb-4" type="text" id="number_phone_representative" <#if journal.number_phone_representative??>value="${journal.number_phone_representative}"</#if>>

            <label class="form-label" for="snils">СНИСЛ (при наличии)</label>
            <input class="form-control mb-4" type="text" id="snils" <#if journal.snils??>value="${journal.snils}"</#if>>

            <label class="form-label" for="polis">Полис обязательного медицинского страхования (при наличии)</label>
            <input class="form-control mb-4" type="text" id="polis" <#if journal.polis??>value="${journal.polis}"</#if>>

            <label class="form-label" for="delivered">Пациент доставлен (направлен)</label>
            <input class="form-select mb-4" type="text" id="delivered" <#if journal.delivered??>value="${journal.delivered}"</#if>>

            <label class="form-label" for="medical_card">Номер медицинской карты</label>
            <input class="form-control mb-4" type="text" id="medical_card" <#if journal.medical_card??>value="${journal.medical_card}"</#if>>

            <label class="form-label" for="medical">Диагноз заболевания (состояния), поставленный направившей медицинской организацией,<br>
                выездной бригадой скорой медицинской помощи (код по МКБ)</label>
            <input class="form-control mb-4" type="text" id="medical" <#if journal.medical??>value="${journal.medical}"</#if>>

            <label class="form-label" for="cause_injury">Причина и обстоятельства трамвы (в том числе при дорожно-транспортных проишествиях)
                отравления (код по МКБ)</label>
            <input class="form-control mb-4" type="text" id="cause_injury" <#if journal.cause_injury??>value="${journal.cause_injury}"</#if>>

            <label class="form-label" for="fact_alcohol">Факт употребления алкоголя и иных психоактивных веществ,<br>
                установление наличия или отсутствия признаков состояния опьянения при поступленим пациента<br>
                в медицинскую организацию</label>
            <input class="form-control mb-4" type="text" id="fact_alcohol" <#if journal.fact_alcohol??>value="${journal.fact_alcohol}"</#if>>

            <label class="form-label" for="date_time_alcohol">Дата и время взятия пробы</label>
            <input class="form-control mb-4" type="datetime-local" id="date_time_alcohol" <#if journal.date_time_alcohol??>value="${journal.date_time_alcohol}"</#if>>

            <label class="form-label" for="result_research">Результаты лабораторных исследований</label>
            <input class="form-control mb-4" type="text" id="result_research" <#if journal.result_research??>value="${journal.result_research}"</#if>>

            <label class="form-label" for="department_medical_organization">Отделение медицинской организации, в которое направлен пациент</label>
            <input class="form-control mb-4" type="text" id="department_medical_organization" <#if journal.department_medical_organization??>value="${journal.department_medical_organization}"</#if>>

            <label class="form-label" for="outcome_hospitalization">Исход госпитализации</label>
            <input class="form-select mb-4" type="text" id="outcome_hospitalization" <#if journal.outcome_hospitalization??>value="${journal.outcome_hospitalization}"</#if>>

            <label class="form-label" for="date_time_discharge">Дата и время исхода</label>
            <input class="form-control mb-4" type="datetime-local" id="date_time_discharge" <#if journal.local_date_time_discharge??>value="${journal.local_date_time_discharge}"</#if>>

            <#if journal.outcome_hospitalization == option>
                <label class="form-label" for="medical_organization_transferred">Наименование медицинской организации, куда переведен пациент</label>
                <input class="form-control mb-4" type="text" id="medical_organization_transferred" value="${journal.medical_organization_transferred}">
            </#if>

            <label class="form-label" for="date_time_inform"> Дата и время сообщения законному представителю, иному лицу<br>
                или медицинской организации, направившей пациента, о госпитализации (отказе в госпитализации) пациента, ее исходе</label>
            <input class="form-control mb-4" type="datetime-local" id="date_time_inform" <#if journal.date_time_inform??>value="${journal.date_time_inform}"</#if>>

            <h4> В случае отказа в госпитализации в стационар, дневной стационар</h4>

            <label class="form-label" for="reason_refusal">Причина отказа в гослитализации</label>
            <input class="form-select mb-4" type="text" id="reason_refusal" <#if journal.reason_refusal??>value="${journal.reason_refusal}"</#if>>

            <label class="form-label" for="full_name_medical_worker">Фамилия, имя, отчество (при наличии) медицинского работника,
                зафиксировавшего причину отказа в госпитализации</label>
            <input class="form-control mb-4" type="text" id="full_name_medical_worker" <#if journal.full_name_medical_worker??>value="${journal.full_name_medical_worker}"</#if>>

            <label class="form-label" for="additional_information">Дополнительные сведения</label>
            <input class="form-control mb-4" type="text" id="additional_information" <#if journal.additional_information??>value="${journal.additional_information}"</#if>>

        </div>
    </fieldset>
</@t.page>

