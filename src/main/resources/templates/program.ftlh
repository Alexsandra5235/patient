<#import "blocks/template.ftlh" as t>

<@t.page titlePage="ДОБАВЛЕНИЕ ИНДИВИДУАЛЬНОЙ ПРОГРАММЫ ЛЕЧЕНИЯ">

    <section class="container" style="height: 100vh; width: 100vw; overflow-y: auto; position: relative; "
             xmlns="http://www.w3.org/1999/html">
        <div class="container" style="justify-content: center; border-radius: 7px">
            <div class="row d-flex justify-content-center align-items-center ">
                <div class="col-md-12 col-xl-10">

                    <div class="card">
                        <div class="card-body">

                            <div class="text-center mb-3">
<#--                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-todo-list/check1.webp"-->
<#--                                     alt="Check" width="60">-->
                                <h2 class="text-black">Индивидульная программа санаторного лечения</h2>
                                <a href="/log/info/${log.id}" class="h6 mb-1" style="text-decoration: none; color: black">Пациент: <span style="color: dodgerblue">${patient.full_name}</span></a>
                                <h6 class="mb-0">Пациент поступил: <span style="color: dodgerblue">${log.normal_data.str_date_receipt} ${log.log_receipt.string_time_receipt}</span></h6>
                                <#if log.medical?? && log.medical.code??>
                                    <h6 class="mb-3">Диагноз пациента: <span style="color: dodgerblue">${log.medical.code} - ${log.medical.value}</span></h6>
                                </#if>

                                <!-- Вертикально центрированное модальное окно -->
                                <div class="modal fade" id="exampleModalScrollable" tabindex="-1" aria-labelledby="exampleModalScrollableTitle" style="display: none;" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalScrollableTitle">Добавление данных в программу лечения</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
                                            </div>
                                            <form action="/patient/${patient.id}/add/destination" method="post">
                                                <div class="modal-body">

                                                    <label for="date" class="form-label">Выбирите дату</label>
                                                    <select id="date" class="form-control mb-2" name="date_procedure">
                                                        <#list dateProcedures as date>
                                                            <option value="${date}">${date}</option>
                                                        </#list>
                                                    </select>
                                                    <label for="date" class="form-label">Выбирите время</label>
                                                    <select id="date" class="form-control mb-2" name="time_procedure">
                                                        <#list times as time>
                                                            <option value="${time}">${time}</option>
                                                        </#list>
                                                    </select>
                                                    <label for="procedures" class="form-label">Выбирите процедуру</label>
                                                    <select id="procedures" class="form-control mb-2" name="procedure">
                                                        <#list procedures as procedure>
                                                            <option value="${procedure.id}">${procedure.procedureName}</option>
                                                        </#list>
                                                    </select>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                                                    <input type="submit" class="btn btn-primary" value="Сохранить изменения">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <!-- Вертикально центрированное модальное окно -->
                                <div class="modal fade" id="exampleModalDelete" tabindex="-1" aria-labelledby="exampleModalScrollableTitle" style="display: none;" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalScrollableTitle">Удаление данных из программы лечения</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
                                            </div>

                                                <div class="modal-body">
                                                    <div class="accordion" id="accordionExample">
                                                        <#list dateProcedures as date>
                                                            <#assign hasProcedures = false>
                                                            <#list destinations as destination>
                                                                <#if destination.date_procedure == date>
                                                                    <#assign hasProcedures = true>
                                                                </#if>
                                                            </#list>

                                                            <#if hasProcedures>

                                                                <div class="accordion-item">
                                                                    <h2 class="accordion-header">
                                                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#${date}" aria-expanded="false" aria-controls="${date}">
                                                                            ${date}
                                                                        </button>
                                                                    </h2>
                                                                    <div id="${date}" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                                                        <div class="accordion-body" style="text-align: left">
                                                                            <#list destinations as destination>
                                                                                <#if destination.date_procedure == date>
                                                                                    <div class="dropdown">
                                                                                        <a class="h6 dropdown-toggle" style="text-decoration: none" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                                                                                            ${destination.procedure.procedureName} - ${destination.time_procedure}
                                                                                        </a>

                                                                                        <form action="/patient/${patient.id}/delete/destination/${destination.id}" method="post">
                                                                                            <ul class="dropdown-menu">
                                                                                                <li><button class="dropdown-item" type="submit">Удалить</button></li>
                                                                                            </ul>
                                                                                        </form>
                                                                                    </div>

                                                                                </#if>
                                                                            </#list>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </#if>
                                                        </#list>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                                                    <input type="submit" class="btn btn-primary" value="Сохранить изменения">
                                                </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="bd-example input-group mt-2" style="width: 100%">
                                    <a href="#" style="width: 50%" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModalScrollable">
                                        Дополнить программу лечения
                                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
                                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
                                        </svg>
                                    </a>
                                    <a href="#" style="width: 50%" type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModalDelete">
                                        Удалить процедуру из программы лечения
                                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-dash-circle-fill" viewBox="0 0 16 16">
                                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h7a.5.5 0 0 0 0-1h-7z"/>
                                        </svg>
                                    </a>
                                </div>
                            </div>

                            <table style="border: 1px" class="table table-bordered table-hover">
                                <tr style="text-align: center">
                                    <th style="horiz-align: center" rowspan="2">Дата</th>
                                    <th colspan="9">Время</th>
                                </tr>
                                <tr>
                                    <#list times as time>
                                        <td>${time}</td>
                                    </#list>
                                </tr>
                                <tbody>
                                <#list dateProcedures as date>
                                    <tr>
                                        <td>${date}</td>
                                        <#list times as time>
                                            <td>
                                                <#assign procedureFound = false>
                                                <#list destinations as destination>
                                                    <#if destination.date_procedure == date && destination.time_procedure == time>
                                                        <#assign procedureFound = true>
                                                        ${destination.procedure.procedureName}
                                                    </#if>
                                                </#list>
                                                <#if !procedureFound>

                                                </#if>
                                            </td>
                                        </#list>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
</@t.page>