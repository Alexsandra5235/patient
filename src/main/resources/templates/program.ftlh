<#import "blocks/template.ftlh" as t>

<@t.page titlePage="ДОБАВЛЕНИЕ ИНДИВИДУАЛЬНОЙ ПРОГРАММЫ ЛЕЧЕНИЯ">

    <section class="container mt-3" style="height: 100vh; width: 100vw; position: relative; ">
        <div class="container" style="justify-content: center; border-radius: 7px">
            <div class="row d-flex justify-content-center align-items-center ">
                <div class="col-md-12 col-xl-10">

                    <div class="card mask-custom">
                        <div class="card-body">

                            <div class="text-center mb-3">
<#--                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-todo-list/check1.webp"-->
<#--                                     alt="Check" width="60">-->
                                <h2 class="text-black">Индивидульная программа санаторного лечения</h2>
                                <a href="/log/info/${log.id}" class="h6 mb-1" style="text-decoration: none; color: black">Пациент: <span style="color: dodgerblue">${patient.full_name}</span></a>
                                <h6 class="mb-0">Пациент поступил: <span style="color: dodgerblue">${log.normal_data.str_date_receipt} ${log.log_receipt.string_time_receipt}</span></h6>
                                <h6 class="mb-3">Диагноз пациента: <span style="color: dodgerblue">${log.medical.code} - ${log.medical.value}</span></h6>

                                <!-- Вертикально центрированное модальное окно -->
                                <div class="modal fade" id="exampleModalScrollable" tabindex="-1" aria-labelledby="exampleModalScrollableTitle" style="display: none;" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-scrollable">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalScrollableTitle">Добавление данных в программу лечения</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
                                            </div>
                                            <div class="modal-body">
                                                <label for="date" class="form-label">Выбирите дату</label>
                                                <select id="date" class="form-control mb-2" name="date_procedure">
                                                    <#list dateProcedures as date>
                                                        <option value="${date}">${date}</option>
                                                    </#list>
                                                </select>
                                                <label for="date" class="form-label">Выбирите время</label>
                                                <select id="date" class="form-control mb-2" name="time_procedure">
                                                    <option value="09:00">09:00</option>
                                                    <option value="10:00">10:00</option>
                                                    <option value="11:00">11:00</option>
                                                    <option value="12:00">12:00</option>
                                                    <option value="13:00">13:00</option>
                                                    <option value="14:00">14:00</option>
                                                    <option value="15:00">15:00</option>
                                                    <option value="16:00">16:00</option>
                                                    <option value="17:00">17:00</option>
                                                </select>
                                                <label for="procedures" class="form-label">Выбирите процедуру</label>
                                                <select id="procedures" class="form-control mb-2" name="procedure">
                                                    <#list procedures as procedure>
                                                        <option value="${procedure}">${procedure.procedureName}</option>
                                                    </#list>
                                                </select>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                                                <button type="button" class="btn btn-primary">Сохранить изменения</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="bd-example">
                                    <a href="#" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModalScrollable">
                                        Дополнить программу лечения
                                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
                                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
                                        </svg>
                                    </a>
                                </div>

                            </div>

                            <table style="border: 1px" class="table table-bordered">
                                <tr>
                                    <th rowspan="2">Дата</th>
                                    <th colspan="9">Время</th>
                                </tr>
                                <tr>
                                    <td>09:00</td>
                                    <td>10:00</td>
                                    <td>11:00</td>
                                    <td>12:00</td>
                                    <td>13:00</td>
                                    <td>14:00</td>
                                    <td>15:00</td>
                                    <td>16:00</td>
                                    <td>17:00</td>
                                </tr>
                                <#list dateProcedures as date>
                                    <tr>
                                        <td>${date}</td>
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
                                </#list>

                            </table>

<#--                            <table class="table text-white mb-0">-->
<#--                                <thead>-->
<#--                                <tr>-->
<#--                                    <th scope="col">Дата</th>-->
<#--                                    <th scope="col">Время</th>-->
<#--                                    <th scope="col">Priority</th>-->
<#--                                    <th scope="col">Actions</th>-->
<#--                                </tr>-->
<#--                                </thead>-->
<#--                                <tbody>-->
<#--                                <tr class="fw-normal">-->
<#--                                    <th>-->
<#--                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp"-->
<#--                                             alt="avatar 1" style="width: 45px; height: auto;">-->
<#--                                        <span class="ms-2">Alice Mayer</span>-->
<#--                                    </th>-->
<#--                                    <td class="align-middle">-->
<#--                                        <span>Call Sam For payments</span>-->
<#--                                    </td>-->
<#--                                    <td class="align-middle">-->
<#--                                        <h6 class="mb-0"><span class="badge bg-danger">High priority</span></h6>-->
<#--                                    </td>-->
<#--                                    <td class="align-middle">-->
<#--                                        <a href="#!" data-mdb-tooltip-init title="Done"><i-->
<#--                                                    class="fas fa-check fa-lg text-success me-3"></i></a>-->
<#--                                        <a href="#!" data-mdb-tooltip-init title="Remove"><i-->
<#--                                                    class="fas fa-trash-alt fa-lg text-warning"></i></a>-->
<#--                                    </td>-->
<#--                                </tr>-->
<#--                                <tr class="fw-normal">-->
<#--                                    <th>-->
<#--                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava2-bg.webp"-->
<#--                                             alt="avatar 1" style="width: 45px; height: auto;">-->
<#--                                        <span class="ms-2">Kate Moss</span>-->
<#--                                    </th>-->
<#--                                    <td class="align-middle">Make payment to Bluedart</td>-->
<#--                                    <td class="align-middle">-->
<#--                                        <h6 class="mb-0"><span class="badge bg-success">Low priority</span></h6>-->
<#--                                    </td>-->
<#--                                    <td class="align-middle">-->
<#--                                        <a href="#!" data-mdb-tooltip-init title="Done"><i-->
<#--                                                    class="fas fa-check fa-lg text-success me-3"></i></a>-->
<#--                                        <a href="#!" data-mdb-tooltip-init title="Remove"><i-->
<#--                                                    class="fas fa-trash-alt fa-lg text-warning"></i></a>-->
<#--                                    </td>-->
<#--                                </tr>-->
<#--                                <tr class="fw-normal">-->
<#--                                    <th>-->
<#--                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3-bg.webp"-->
<#--                                             alt="avatar 1" style="width: 45px; height: auto;">-->
<#--                                        <span class="ms-2">Danny McChain</span>-->
<#--                                    </th>-->
<#--                                    <td class="align-middle">Office rent</td>-->
<#--                                    <td class="align-middle">-->
<#--                                        <h6 class="mb-0"><span class="badge bg-warning">Middle priority</span></h6>-->
<#--                                    </td>-->
<#--                                    <td class="align-middle">-->
<#--                                        <a href="#!" data-mdb-tooltip-init title="Done"><i-->
<#--                                                    class="fas fa-check fa-lg text-success me-3"></i></a>-->
<#--                                        <a href="#!" data-mdb-tooltip-init title="Remove"><i-->
<#--                                                    class="fas fa-trash-alt fa-lg text-warning"></i></a>-->
<#--                                    </td>-->
<#--                                </tr>-->
<#--                                <tr class="fw-normal">-->
<#--                                    <th>-->
<#--                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava5-bg.webp"-->
<#--                                             alt="avatar 1" style="width: 45px; height: auto;">-->
<#--                                        <span class="ms-2">Alexa Chung</span>-->
<#--                                    </th>-->
<#--                                    <td class="align-middle">Office grocery shopping</td>-->
<#--                                    <td class="align-middle">-->
<#--                                        <h6 class="mb-0"><span class="badge bg-danger">High priority</span></h6>-->
<#--                                    </td>-->
<#--                                    <td class="align-middle">-->
<#--                                        <a href="#!" data-mdb-tooltip-init title="Done"><i-->
<#--                                                    class="fas fa-check fa-lg text-success me-3"></i></a>-->
<#--                                        <a href="#!" data-mdb-tooltip-init title="Remove"><i-->
<#--                                                    class="fas fa-trash-alt fa-lg text-warning"></i></a>-->
<#--                                    </td>-->
<#--                                </tr>-->
<#--                                <tr class="fw-normal">-->
<#--                                    <th class="border-0">-->
<#--                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava6-bg.webp"-->
<#--                                             alt="avatar 1" style="width: 45px; height: auto;">-->
<#--                                        <span class="ms-2">Ben Smith</span>-->
<#--                                    </th>-->
<#--                                    <td class="border-0 align-middle">Ask for Lunch to Clients</td>-->
<#--                                    <td class="border-0 align-middle">-->
<#--                                        <h6 class="mb-0"><span class="badge bg-success">Low priority</span></h6>-->
<#--                                    </td>-->
<#--                                    <td class="border-0 align-middle">-->
<#--                                        <a href="#!" data-mdb-tooltip-init title="Done"><i-->
<#--                                                    class="fas fa-check fa-lg text-success me-3"></i></a>-->
<#--                                        <a href="#!" data-mdb-tooltip-init title="Remove"><i-->
<#--                                                    class="fas fa-trash-alt fa-lg text-warning"></i></a>-->
<#--                                    </td>-->
<#--                                </tr>-->
<#--                                </tbody>-->
<#--                            </table>-->


                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
</@t.page>