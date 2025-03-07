<#import "blocks/template.ftlh" as t>

<@t.page titlePage="ИНФОРМАЦИЯ О ПАЦИЕНТЕ" namePage="infoJournal">



<div class="container" style="height: 100vh; width: 100vw; overflow-y: auto; position: relative; ">
    <div class="container-fluid pt-4">
        <div class="card bg-dark text-white">
            <div class="card-body">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/" style="padding-right: 14px">Главная</a>></li>
                        <li class="breadcrumb-item active text-white" aria-current="page" style="padding-left: 0">Просмотр записи</li>
                    </ol>
                </nav>
                <h5 class="card-title">Полная информация по пациенту<span class="h5" style="color: dodgerblue"> ${journal.full_name}</span></h5>
                <#if journal.dateAddRecord?? && journal.timeAddRecord??>
                    <p class="card-text" style="margin-bottom: 8px">Дата и время создания записи: ${journal.dateAddRecord} ${journal.timeAddRecord}</p>
                </#if>
<#--                <p class="card-text">На этой странице отображаются все данные по пациенту.-->
<#--                    Выбирите действие, если необходимо-->
<#--                    <span class="card-text" style="color: red">удалить</span>-->
<#--                    или <span class="card-text" style="color: dodgerblue">редактировать</span>-->
<#--                    информацию по пациенту.</p>-->
<#--                <div class="btn-group" role="group">-->
<#--                    <form action="/journal/edit/${journal.id}" method="get">-->
<#--                        <button class="btn btn-primary mx-4">-->
<#--                            Редактировать запись-->
<#--                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">-->
<#--                                <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z"/>-->
<#--                            </svg>-->
<#--                        </button>-->
<#--                    </form>-->

<#--                    <form action="/journal/delete/${journal.id}" method="post">-->
<#--                        <button class="btn btn-danger" id="liveToastBtn">-->
<#--                            Удалить запись-->
<#--                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">-->
<#--                                <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>-->
<#--                            </svg>-->
<#--                        </button>-->
<#--                    </form>-->
<#--                </div>-->
            </div>
        </div>
    </div>

    <span class="d-flex text-dark justify-content-center" style="padding: 20px 0 20px 0; font-weight: bold">
        <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-eyeglasses" viewBox="0 0 16 16">
            <path d="M4 6a2 2 0 1 1 0 4 2 2 0 0 1 0-4zm2.625.547a3 3 0 0 0-5.584.953H.5a.5.5 0 0 0 0 1h.541A3 3 0 0 0 7 8a1 1 0 0 1 2 0 3 3 0 0 0 5.959.5h.541a.5.5 0 0 0 0-1h-.541a3 3 0 0 0-5.584-.953A1.993 1.993 0 0 0 8 6c-.532 0-1.016.208-1.375.547zM14 8a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
        </svg>
    </span>

    <div class="container text-white blurBG" style="justify-content: center; width: 50vw; border-radius: 7px; margin-bottom: 20px">
        <a href="/journal/edit/${journal.id}" hidden="hidden" id="formEditRecord"></a>

        <form action="/journal/delete/${journal.id}" method="post" hidden="hidden">
            <input type="submit" id="btnDelete">
        </form>
        <fieldset disabled>
            <div class="container text-left">
                <h4 style="padding-top: 16px">Полная информация</h4>
                <hr>

                <label class="form-label" for="date_receipt">Дата поступления:</label>
                <p id="date_receipt"><#if journal.normal_data?? && journal.normal_data.str_date_receipt??>${journal.normal_data.str_date_receipt}</#if></p>
                <hr>

                <label class="form-label" for="string_time_receipt">Время поступления:</label>
                <p id="string_time_receipt"><#if journal.string_time_receipt??>${journal.string_time_receipt}</#if></p>
                <hr>

                <label class="form-label" for="full_name">Фамилия, имя, отчестов (при наличии):</label>
                <p id="full_name"><#if journal.full_name??>${journal.full_name}</#if></p>
                <hr>

                <label class="form-label" for="birth_day">Дата рождения (число, месяц, год):</label>
                <p id="birth_day"><#if journal.normal_data?? && journal.normal_data.str_birth_day??>${journal.normal_data.str_birth_day}</#if></p>
                <hr>

                <label class="form-label" for="gender">Пол (мужской, женский):</label>
                <p id="gender"><#if journal.gender??>${journal.gender}</#if></p>
                <hr>

                <label class="form-label" for="password">Серия и номер паспорта или иного документа, удостоверяющего личность (при наличии)</label><br>
                <p id="password"><#if journal.password??> ${journal.password}</#if></p>
                <hr>

                <label class="form-label" for="nationality">Гражданство</label><br>
                <p id="nationality"><#if journal.nationality??>${journal.nationality}<#else> - </#if></p>
                <hr>

                <label class="form-label" for="address">Регистрация по месту жительсва</label><br>
                <p id="address"><#if journal.address??>${journal.address}<#else> - </#if></p>
                <hr>

                <label class="form-label" for="registration_place_stay">Регистрация по месту пребывания пациента</label><br>
                <p id="registration_place_stay"><#if journal.registration_place_stay??>${journal.registration_place_stay}<#else> - </#if></p>
                <hr>

                <label class="form-label" for="number_phone_representative">Номер телефона законного представителя, лица, которому может
                    быть передана информация о состоянии здоровья пациента</label>
                <p id="number_phone_representative"><#if journal.number_phone_representative??>${journal.number_phone_representative}</#if></p>
                <hr>

                <label class="form-label" for="snils">СНИСЛ (при наличии)</label>
                <p id="snils"><#if journal.snils??>${journal.snils}</#if></p>
                <hr>

                <label class="form-label" for="polis">Полис обязательного медицинского страхования (при наличии)</label>
                <p id="polis"><#if journal.polis??>${journal.polis}</#if></p>
                <hr>

                <label class="form-label" for="delivered">Пациент доставлен (направлен)</label>
                <p id="delivered"><#if journal.delivered??>${journal.delivered}</#if></p>
                <hr>

                <label class="form-label" for="medical_card">Номер медицинской карты</label>
                <p id="medical_card"><#if journal.medical_card??>${journal.medical_card}</#if></p>
                <hr>

                <label class="form-label" for="medical">Диагноз заболевания (состояния), поставленный направившей медицинской организацией,
                    выездной бригадой скорой медицинской помощи (код по МКБ)</label>
                <p id="medical"><#if journal.medical?? && journal.medical.code??>${journal.medical.code}</#if></p>
                <hr>

                <label class="form-label" for="cause_injury">Причина и обстоятельства трамвы (в том числе при дорожно-транспортных проишествиях)
                    отравления (код по МКБ)</label>
                <p id="cause_injury"><#if journal.cause_injury?? && journal.cause_injury.code??>${journal.cause_injury.code}</#if></p>
                <hr>

                <label class="form-label" for="fact_alcohol">Факт употребления алкоголя и иных психоактивных веществ,
                    установление наличия или отсутствия признаков состояния опьянения при поступленим пациента
                    в медицинскую организацию</label>
                <p id="fact_alcohol"><#if journal.fact_alcohol??>${journal.fact_alcohol}</#if></p>
                <hr>

                <label class="form-label" for="date_time_alcohol">Дата и время взятия пробы</label>
                <p id="date_time_alcohol"><#if journal.normal_data?? && journal.normal_data.str_date_time_alcohol??>${journal.normal_data.str_date_time_alcohol}</#if></p>
                <hr>

                <label class="form-label" for="result_research">Результаты лабораторных исследований</label>
                <p id="result_research"><#if journal.result_research??>${journal.result_research}</#if></p>
                <hr>

                <label class="form-label" for="department_medical_organization">Отделение медицинской организации, в которое направлен пациент</label>
                <p id="department_medical_organization"><#if journal.department_medical_organization??>${journal.department_medical_organization}</#if></p>
                <hr>

                <label class="form-label" for="outcome_hospitalization">Исход госпитализации</label>
                <p id="outcome_hospitalization"><#if journal.outcome_hospitalization??>${journal.outcome_hospitalization}</#if></p>
                <hr>

                <label class="form-label" for="date_time_discharge">Дата и время исхода</label>
                <p id="date_time_discharge"><#if journal.normal_data?? && journal.normal_data.str_local_date_time_discharge??>${journal.normal_data.str_local_date_time_discharge}</#if></p>
                <hr>

                <#if journal.outcome_hospitalization == option>
                    <label class="form-label" for="medical_organization_transferred">Наименование медицинской организации, куда переведен пациент</label>
                    <p id="medical_organization_transferred">${journal.medical_organization_transferred}</p>
                    <hr>
                </#if>

                <label class="form-label" for="date_time_inform"> Дата и время сообщения законному представителю, иному лицу<br>
                    или медицинской организации, направившей пациента, о госпитализации (отказе в госпитализации) пациента, ее исходе</label>
                <p id="date_time_inform"><#if journal.normal_data?? && journal.normal_data.str_date_time_inform??>${journal.normal_data.str_date_time_inform}</#if></p>
                <hr>

                <h4> В случае отказа в госпитализации в стационар, дневной стационар</h4>

                <label class="form-label" for="reason_refusal">Причина отказа в гослитализации</label>
                <p id="reason_refusal"><#if journal.reason_refusal??>${journal.reason_refusal}</#if></p>
                <hr>

                <label class="form-label" for="full_name_medical_worker">Фамилия, имя, отчество (при наличии) медицинского работника,
                    зафиксировавшего причину отказа в госпитализации</label>
                <p id="full_name_medical_worker"><#if journal.full_name_medical_worker??>${journal.full_name_medical_worker}</#if></p>
                <hr>

                <label class="form-label" for="additional_information">Дополнительные сведения</label>
                <p id="additional_information"><#if journal.additional_information??>${journal.additional_information}</#if></p>
                <hr>
            </div>
        </fieldset>
    </div>
</div>
</@t.page>

