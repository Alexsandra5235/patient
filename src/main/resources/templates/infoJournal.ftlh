<#import "blocks/template.ftlh" as t>

<@t.page titlePage="ИНФОРМАЦИЯ О ПАЦИЕНТЕ" namePage="infoJournal">



<div class="container" style="height: 100vh; width: 100vw; overflow-y: auto; position: relative; ">
    <#if log.patient??>
        <div class="container-fluid pt-4">
            <div class="card bg-dark text-white">
                <div class="card-body">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/" style="padding-right: 14px">Главная</a>></li>
                            <li class="breadcrumb-item active text-white" aria-current="page" style="padding-left: 0">Просмотр записи</li>
                        </ol>
                    </nav>
                    <#if log.patient.full_name??>
                        <h5 class="card-title mb-2">Полная информация по пациенту<span class="h5" style="color: dodgerblue"> ${log.patient.full_name}</span></h5>
                    </#if>
                    <#if datetime_create_record??>
                        <p class="card-text mb-1">Дата и время создания записи: ${datetime_create_record}</p>
                    </#if>
                    <#if datetime_edit_record??>
                        <p class="card-text mb-1" style="margin-bottom: 8px">Дата и время последнего редактирования записи: ${datetime_edit_record}</p>
                    </#if>
                    <a class="btn btn-primary" href="/patient/${log.patient.id}/programs/add">Добавить план лечения</a>

                </div>
            </div>
        </div>

        <span class="d-flex text-dark justify-content-center" style="padding: 20px 0 20px 0; font-weight: bold">
            <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-eyeglasses" viewBox="0 0 16 16">
                <path d="M4 6a2 2 0 1 1 0 4 2 2 0 0 1 0-4zm2.625.547a3 3 0 0 0-5.584.953H.5a.5.5 0 0 0 0 1h.541A3 3 0 0 0 7 8a1 1 0 0 1 2 0 3 3 0 0 0 5.959.5h.541a.5.5 0 0 0 0-1h-.541a3 3 0 0 0-5.584-.953A1.993 1.993 0 0 0 8 6c-.532 0-1.016.208-1.375.547zM14 8a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
            </svg>
        </span>

        <div class="container text-white blurBG" style="justify-content: center; width: 50vw; border-radius: 7px; margin-bottom: 20px">
            <a href="/log/edit/${log.id}" hidden="hidden" id="formEditRecord"></a>

            <form action="/log/delete/${log.id}" method="post" hidden="hidden">
                <input type="submit" id="btnDelete">
            </form>
            <fieldset disabled>
                <div class="container text-left">
                    <h4 style="padding-top: 16px">Полная информация</h4>
                    <hr>

                    <label class="form-label" for="date_receipt">Дата поступления:</label>
                    <p id="date_receipt"><#if log.normal_data?? && log.normal_data.str_date_receipt??>${log.normal_data.str_date_receipt}</#if></p>
                    <hr>

                    <label class="form-label" for="string_time_receipt">Время поступления:</label>
                    <p id="string_time_receipt"><#if log.log_receipt?? && log.log_receipt.string_time_receipt??>${log.log_receipt.string_time_receipt}</#if></p>
                    <hr>

                    <label class="form-label" for="full_name">Фамилия, имя, отчестов (при наличии):</label>
                    <p id="full_name"><#if log.patient.full_name??>${log.patient.full_name}</#if></p>
                    <hr>

                    <label class="form-label" for="birth_day">Дата рождения (число, месяц, год):</label>
                    <p id="birth_day"><#if log.normal_data?? && log.normal_data.str_birth_day??>
                            ${log.normal_data.str_birth_day}</#if></p>
                    <hr>

                    <label class="form-label" for="gender">Пол (мужской, женский):</label>
                    <p id="gender"><#if log.patient.gender??>${log.patient.gender}</#if></p>
                    <hr>

                    <label class="form-label" for="password">Серия и номер паспорта или иного документа,
                        удостоверяющего личность (при наличии)</label><br>
                    <p id="password"><#if log.patient.password??> ${log.patient.password}</#if></p>
                    <hr>

                    <label class="form-label" for="nationality">Гражданство</label><br>
                    <p id="nationality"><#if log.patient.nationality??>${log.patient.nationality}</#if></p>
                    <hr>

                    <label class="form-label" for="address">Регистрация по месту жительсва</label><br>
                    <p id="address"><#if log.patient.address??>${log.patient.address}</#if></p>
                    <hr>

                    <label class="form-label" for="registration_place_stay">Регистрация по месту пребывания пациента</label><br>
                    <p id="registration_place_stay"><#if log.patient.registration_place_stay??>
                            ${log.patient.registration_place_stay}</#if></p>
                    <hr>

                    <label class="form-label" for="number_phone_representative">Номер телефона законного представителя, лица, которому может
                        быть передана информация о состоянии здоровья пациента</label>
                    <p id="number_phone_representative"><#if log.log_receipt?? && log.log_receipt.number_phone_representative??>
                            ${log.log_receipt.number_phone_representative}</#if></p>
                    <hr>

                    <label class="form-label" for="snils">СНИСЛ (при наличии)</label>
                    <p id="snils"><#if log.patient.snils??>${log.patient.snils}</#if></p>
                    <hr>

                    <label class="form-label" for="polis">Полис обязательного медицинского страхования (при наличии)</label>
                    <p id="polis"><#if log.patient.polis??>${log.patient.polis}</#if></p>
                    <hr>

                    <label class="form-label" for="delivered">Пациент доставлен (направлен)</label>
                    <p id="delivered"><#if log.log_receipt?? && log.log_receipt.delivered??>${log.log_receipt.delivered}</#if></p>
                    <hr>

                    <label class="form-label" for="medical_card">Номер медицинской карты</label>
                    <p id="medical_card"><#if log.patient.medical_card??>${log.patient.medical_card}</#if></p>
                    <hr>

                    <label class="form-label" for="medical">Диагноз заболевания (состояния), поставленный направившей медицинской
                        организацией, выездной бригадой скорой медицинской помощи (код по МКБ)</label>
                    <p id="medical"><#if log.medical?? && log.medical.code??>${log.medical.code}</#if></p>
                    <hr>

                    <label class="form-label" for="cause_injury">Причина и обстоятельства трамвы (в том числе при
                        дорожно-транспортных проишествиях) отравления (код по МКБ)</label>
                    <p id="cause_injury"><#if log.cause_injury?? && log.cause_injury.code??>
                            ${log.cause_injury.code}</#if></p>
                    <hr>

                    <label class="form-label" for="fact_alcohol">Факт употребления алкоголя и иных психоактивных веществ,
                        установление наличия или отсутствия признаков состояния опьянения при поступленим пациента
                        в медицинскую организацию</label>
                    <p id="fact_alcohol"><#if log.log_receipt?? && log.log_receipt.fact_alcohol??>${log.log_receipt.fact_alcohol}</#if></p>
                    <hr>

                    <label class="form-label" for="date_time_alcohol">Дата и время взятия пробы</label>
                    <p id="date_time_alcohol"><#if log.normal_data?? && log.normal_data.str_date_time_alcohol??>
                            ${log.normal_data.str_date_time_alcohol}</#if></p>
                    <hr>

                    <label class="form-label" for="result_research">Результаты лабораторных исследований</label>
                    <p id="result_research"><#if log.log_receipt?? && log.log_receipt.result_research??>${log.log_receipt.result_research}</#if></p>
                    <hr>

                    <label class="form-label" for="department_medical_organization">Отделение медицинской организации, в которое
                        направлен пациент</label>
                    <p id="department_medical_organization"><#if log.log_receipt?? && log.log_receipt.department_medical_organization??>
                            ${log.log_receipt.department_medical_organization}</#if></p>
                    <hr>

                    <label class="form-label" for="outcome_hospitalization">Исход госпитализации</label>
                    <p id="outcome_hospitalization"><#if log.log_discharge?? && log.log_discharge.outcome_hospitalization??>
                            ${log.log_discharge.outcome_hospitalization}</#if></p>
                    <hr>

                    <label class="form-label" for="date_time_discharge">Дата и время исхода</label>
                    <p id="date_time_discharge"><#if log.normal_data?? && log.normal_data.str_local_date_time_discharge??>
                            ${log.normal_data.str_local_date_time_discharge}</#if></p>
                    <hr>

                    <#if log.log_discharge?? && log.log_discharge.outcome_hospitalization == option>
                        <label class="form-label" for="medical_organization_transferred">Наименование медицинской организации,
                            куда переведен пациент</label>
                        <p id="medical_organization_transferred">${log.log_discharge.medical_organization_transferred}</p>
                        <hr>
                    </#if>

                    <label class="form-label" for="date_time_inform"> Дата и время сообщения законному представителю, иному лицу
                        или медицинской организации, направившей пациента, о госпитализации (отказе в госпитализации) пациента,
                        ее исходе</label>
                    <p id="date_time_inform"><#if log.normal_data?? && log.normal_data.str_date_time_inform??>
                            ${log.normal_data.str_date_time_inform}</#if></p>
                    <hr>

                    <h4> В случае отказа в госпитализации в стационар, дневной стационар</h4>

                    <label class="form-label" for="reason_refusal">Причина отказа в гослитализации</label>
                    <p id="reason_refusal"><#if log.log_reject?? && log.log_reject.reason_refusal??>${log.log_reject.reason_refusal}</#if></p>
                    <hr>

                    <label class="form-label" for="full_name_medical_worker">Фамилия, имя, отчество (при наличии) медицинского
                        работника, зафиксировавшего причину отказа в госпитализации</label>
                    <p id="full_name_medical_worker"><#if log.log_reject?? && log.log_reject.full_name_medical_worker??>
                            ${log.log_reject.full_name_medical_worker}</#if></p>
                    <hr>

                    <label class="form-label" for="additional_information">Дополнительные сведения</label>
                    <p id="additional_information"><#if log.log_reject?? && log.log_reject.additional_information??>${log.log_reject.additional_information}</#if></p>
                    <hr>
                </div>
            </fieldset>
        </div>

        <#else>
            <div class="container-fluid pt-4">
                <div class="card bg-dark text-white">
                    <div class="card-body">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/" style="padding-right: 14px">Главная</a>></li>
                                <li class="breadcrumb-item active text-white" aria-current="page" style="padding-left: 0">Просмотр записи</li>
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

