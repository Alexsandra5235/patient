<#import "blocks/template.ftlh" as t>

<@t.page titlePage="ИЗМЕНЕНИЕ ЗАПИСИ" namePage="editJournal">

<div class="container" style="height: 100vh; width: 100vw; overflow-y: auto; position: relative;">

    <#if log.patient??>
        <div class="container-fluid pt-4">
            <div class="card bg-dark text-white">
                <div class="card-body">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/" style="padding-right: 14px">Главная</a>></li>
                            <li class="breadcrumb-item"><a href="/log/info/${log.id}" style="padding-right: 14px">Просмотр записи</a>></li>
                            <li class="breadcrumb-item active text-white" aria-current="page" style="padding-left: 0">Редактирование записи</li>
                        </ol>
                    </nav>
                    <#if log.patient.full_name??>
                        <h5 class="card-title mb-2">Редактирование информации по пациенту <span class="h5" style="color: dodgerblue"> ${log.patient.full_name}</span></h5>
                    </#if>
                    <#if datetime_create_record??>
                        <p class="card-text mb-1">Дата и время создания записи: ${datetime_create_record}</p>
                    </#if>
                    <#if datetime_edit_record??>
                        <p class="card-text" style="margin-bottom: 8px">Дата и время последнего редактирования записи: ${datetime_edit_record}</p>
                    </#if>

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

            <form action="/log/save/edit/${log.id}" method="post" autocomplete="off" style="padding: 10px; margin-bottom: 20px">
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
                <input class="form-control mb-4" type="date" name="date_receipt" id="date_receipt"
                       <#if log.log_receipt?? && log.log_receipt.date_receipt??>value="${log.log_receipt.date_receipt}"</#if> required>

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
                <input class="form-control mb-4" type="time" name="string_time_receipt" id="string_time_receipt"
                       <#if log.log_receipt?? && log.log_receipt.string_time_receipt??>value="${log.log_receipt.string_time_receipt}"</#if> required>

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
                <input class="form-control mb-4" type="text" name="full_name" id="full_name" placeholder="Иванов Иван Иванович" autocomplete="off" <#if log.patient.full_name??>value="${log.patient.full_name}"</#if> required>

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
                <input class="form-control mb-4" type="date" name="birth_day" id="birth_day" <#if log.patient.birth_day??>value="${log.patient.birth_day}"</#if> required>

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
                        <option value="${option}" <#if log.patient.gender?? && log.patient.gender == option>selected</#if>>${option}</option>
                    </#list>
                </select>

                <label class="form-label" for="password">Серия и номер паспорта или иного документа, удостоверяющего личность (при наличии)</label><br>
                <input class="form-control mb-4" type="text" name="password" id="password" oninput="formatPassportInput(this)" maxlength="12" placeholder="XX XX XXXXXX" <#if log.patient.password??>value="${log.patient.password}"</#if>>

                <label class="form-label" for="nationality">Гражданство</label><br>
                <input class="form-control mb-4" type="text" id="nationality" name="nationality" <#if log.patient.nationality??>value="${log.patient.nationality}"</#if>>
                <div id="suggestions_country"></div>

                <label class="form-label" for="address">Регистрация по месту жительсва</label><br>
                <input class="form-control mb-4" type="text" id="address" name="address" autocomplete="off" size="100" <#if log.patient.address??>value="${log.patient.address}"</#if>>
                <div id="suggestions"></div>

                <label class="form-label" for="registration_place_stay">Регистрация по месту пребывания пациента</label><br>
                <input type="text" class="form-control" name="registration_place_stay" id="registration_place_stay" <#if log.patient.registration_place_stay??>value="${log.patient.registration_place_stay}"</#if>>
                <div id="suggestions-stay" style="margin-top: 0"></div>
                <label class="mb-4">
                    <input type="checkbox" class="custom-checkbox" value="Совпадает с местом регистрации" onclick="copyText()">
                    Совпадает с местом регистрации
                </label>

                <label class="form-label" for="number_phone_representative">Номер телефона законного представителя, лица, которому может
                    быть передана информация о состоянии здоровья пациента</label>
                <input class="form-control mb-4" type="text" id="number_phone_representative" name="number_phone_representative"
                       maxlength="18" placeholder="8 (XXX) XXX XX XX" oninput="formatPhone(this)" autocomplete="off"
                       <#if log.log_receipt?? && log.log_receipt.number_phone_representative??>value="${log.log_receipt.number_phone_representative}"</#if>>

                <label class="form-label" for="snils">СНИСЛ (при наличии)</label>
                <input class="form-control mb-4" type="text" id="snils" name="snils" maxlength="14" oninput="formatSnils(this)" placeholder="XXX-XXX-XXX XX" autocomplete="off" <#if log.patient.snils??>value="${log.patient.snils}"</#if>>

                <label class="form-label" for="polis">Полис обязательного медицинского страхования (при наличии)</label>
                <input class="form-control mb-4" type="text" id="polis" name="polis" maxlength="16" autocomplete="off"
                       placeholder="XXXXXXXXXXXXXXXX" oninput="this.value = this.value.replace(/[^0-9]/g, '')"
                       <#if log.patient.polis??>value="${log.patient.polis}"</#if>>

                <label class="form-label" for="delivered">Пациент доставлен (направлен)</label>
                <select class="form-select mb-4" name="delivered" id="delivered" size="1">
                    <option value="" style="font-weight: bold">Пожалуйста, сделайте выбор</option>
                    <#list optionsDelivered as option>
                        <option value="${option}" <#if log.log_receipt?? && log.log_receipt.delivered == option>selected</#if>>${option}</option>
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
                <input class="form-control mb-4" type="text" name="medical_card" id="medical_card" required
                       <#if log.patient.medical_card??>value="${log.patient.medical_card}"</#if>>

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
                <input class="form-control mb-4" type="text" id="medical" name="medical_str" oninput="toUpperCaseInput(this)"
                       <#if log.medical?? && log.medical.code??>value="${log.medical.code}"</#if>>
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
                <input class="form-control mb-4" type="text" id="cause_injury" name="cause_injury_str" oninput="toUpperCaseInput(this)" <#if log.cause_injury?? && log.cause_injury.code??>value="${log.cause_injury.code}"</#if>>
                <div id="suggestions_cause"></div>

                <label class="form-label" for="fact_alcohol">Факт употребления алкоголя и иных психоактивных веществ,
                    установление наличия или отсутствия признаков состояния опьянения при поступленим пациента
                    в медицинскую организацию</label>
                <input class="form-control mb-4" type="text" id="fact_alcohol" name="fact_alcohol" autocomplete="off"
                       <#if log.log_receipt?? && log.log_receipt.fact_alcohol??>value="${log.log_receipt.fact_alcohol}"</#if>>

                <label class="form-label" for="date_time_alcohol">Дата и время взятия пробы</label>
                <input class="form-control mb-4" type="datetime-local" id="date_time_alcohol" name="date_time_alcohol"
                       <#if log.log_receipt?? && log.log_receipt.date_time_alcohol??>value="${log.log_receipt.date_time_alcohol}"</#if>>

                <label class="form-label" for="result_research">Результаты лабораторных исследований</label>
                <input class="form-control mb-4" type="text" id="result_research" name="result_research"
                       <#if log.log_receipt?? && log.log_receipt.result_research??>value="${log.log_receipt.result_research}"</#if>>

                <label class="form-label" for="department_medical_organization">Отделение медицинской организации, в которое направлен пациент</label>
                <input class="form-control mb-4" type="text" id="department_medical_organization"
                       name="department_medical_organization" autocomplete="off"
                       <#if log.log_receipt?? && log.log_receipt.department_medical_organization??>
                value="${log.log_receipt.department_medical_organization}"</#if>>

                <label class="form-label" for="outcome_hospitalization">Исход госпитализации</label>
                <select class="form-select mb-4" name="outcome_hospitalization" id="outcome_hospitalization" size="1"
                        onchange="toggleMedicalOrgField()">
                    <option value="" style="font-weight: bold">Пожалуйста, сделайте выбор</option>
                    <#list options as option>
                        <option value="${option}"<#if log.log_discharge?? && log.log_discharge.outcome_hospitalization == option> selected </#if>>${option}</option>
                    </#list>
                </select>

                <label class="form-label" for="local_date_time_discharge">Дата и время исхода</label>
                <input class="form-control mb-4" type="datetime-local" id="local_date_time_discharge"
                       name="local_date_time_discharge" autocomplete="off"
                       <#if log.log_discharge?? && log.log_discharge.local_date_time_discharge??>value="${log.log_discharge.local_date_time_discharge}"</#if>>

                <div id="medicalOrgField">
                    <label class="form-label" for="medical_organization_transferred">Наименование медицинской организации, куда переведен пациент</label>
                    <input class="form-control mb-4" type="text" id="medical_organization_transferred"
                           name="medical_organization_transferred" autocomplete="off"
                           <#if log.log_discharge?? && log.log_discharge.medical_organization_transferred??>value="${log.log_discharge.medical_organization_transferred}"</#if>>
                </div>

                <label class="form-label" for="date_time_inform"> Дата и время сообщения законному представителю, иному лицу<br>
                    или медицинской организации, направившей пациента, о госпитализации (отказе в госпитализации) пациента, ее исходе</label>
                <input class="form-control mb-4" type="datetime-local" id="date_time_inform" name="date_time_inform"
                       autocomplete="off" <#if log.log_discharge?? && log.log_discharge.date_time_inform??>value="${log.log_discharge.date_time_inform}"</#if>>

                <h4> В случае отказа в госпитализации в стационар, дневной стационар</h4>

                <label class="form-label" for="reason_refusal">Причина отказа в гослитализации</label>
                <select class="form-select mb-4" name="reason_refusal" id="reason_refusal" size="1"
                        <#if log.log_reject?? && log.log_reject.reason_refusal??>value="${log.log_reject.reason_refusal}"</#if>>
                    <option value="" style="font-weight: bold">Пожалуйста, сделайте выбор</option>
                    <#list optionsReason as option>
                        <option value="${option}" <#if log.log_reject?? && log.log_reject.reason_refusal == option>selected</#if>>${option}</option>
                    </#list>
                </select>

                <label class="form-label" for="full_name_medical_worker">Фамилия, имя, отчество (при наличии) медицинского работника,
                    зафиксировавшего причину отказа в госпитализации</label>
                <input class="form-control mb-4" type="text" id="full_name_medical_worker" name="full_name_medical_worker"
                       autocomplete="off" placeholder="Иванов Иван Иванович"
                       <#if log.log_reject?? && log.log_reject.full_name_medical_worker??>value="${log.log_reject.full_name_medical_worker}"</#if>>

                <label class="form-label" for="additional_information">Дополнительные сведения</label>
                <input class="form-control mb-4" type="text" id="additional_information" name="additional_information"
                       autocomplete="off" <#if log.log_reject?? && log.log_reject.additional_information??>value="${log.log_reject.additional_information}"</#if>>
            </form>
        </div>
        <#else>
            <div class="container-fluid pt-4">
                <div class="card bg-dark text-white">
                    <div class="card-body">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/" style="padding-right: 14px">Главная</a>></li>
                                <li class="breadcrumb-item"><a href="/log/info/${log.id}" style="padding-right: 14px">Просмотр записи</a>></li>
                                <li class="breadcrumb-item active text-white" aria-current="page" style="padding-left: 0">Редактирование записи</li>
                            </ol>
                        </nav>
                        <div class="card-text">
                            Ошибка загрузки данных
                        </div>
                    </div>
                </div>
            </div>
    </#if>

</div>

</@t.page>


