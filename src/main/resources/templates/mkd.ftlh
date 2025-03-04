<#import "blocks/template.ftlh" as t>

<@t.page titlePage="СПРАВОЧНАЯ ИНФОРМАЦИЯ">

<#--    <div class="container-fluid">-->
<#--        <div class="accordion" id="accordionExample">-->
<#--            <#list classes as class>-->
<#--                <div class="accordion-item">-->
<#--                    <h2 class="accordion-header">-->
<#--                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#${class.indicator}" aria-expanded="true" aria-controls="collapseOne">-->
<#--                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">-->
<#--                                <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>-->
<#--                                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>-->
<#--                            </svg>-->
<#--                            ${class.value}-->
<#--                        </button>-->
<#--                    </h2>-->
<#--                    <#list class.groupData as groupData>-->
<#--                        <div style="margin-left: 30px" id="${class.indicator}" class="accordion-collapse collapse" data-bs-parent="#accordionExample">-->
<#--                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#${groupData.indicator}" aria-expanded="true" aria-controls="collapseOne">-->
<#--                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">-->
<#--                                    <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>-->
<#--                                    <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>-->
<#--                                </svg>-->
<#--                                ${groupData.value}-->
<#--                            </button>-->
<#--                            <#list groupData.groupData as podgroupData>-->
<#--                                <div style="margin-left: 60px" id="${groupData.indicator}" class="accordion-collapse collapse" data-bs-parent="#accordionExample">-->
<#--                                    <div class="accordion-body">-->
<#--                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">-->
<#--                                            <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>-->
<#--                                            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>-->
<#--                                        </svg>-->
<#--                                        ${podgroupData.value}-->
<#--                                    </div>-->
<#--                                </div>-->
<#--                            </#list>-->
<#--                        </div>-->
<#--                    </#list>-->

<#--                </div>-->
<#--            </#list>-->
<#--        </div>-->
<#--    </div>-->


<#--    <div class="container-fluid">-->
<#--        <#list classes as class>-->
<#--            <p type="button" data-bs-toggle="collapse" data-bs-target="#${class.indicator}" aria-expanded="false" aria-controls="collapseExample">-->
<#--                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">-->
<#--                    <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>-->
<#--                    <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>-->
<#--                </svg>-->
<#--                ${class.value}-->
<#--            </p>-->
<#--            <div style="margin-left: 30px" class="collapse" id="${class.indicator}">-->
<#--                <#list class.groupData as groupData>-->
<#--                    <p type="button" data-bs-toggle="collapse" data-bs-target="#${groupData.indicator}" aria-expanded="false" aria-controls="collapseExample">-->
<#--                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">-->
<#--                            <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>-->
<#--                            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>-->
<#--                        </svg>-->
<#--                        ${groupData.value}-->
<#--                    </p>-->
<#--                    <div style="margin-left: 60px" class="collapse" id="${groupData.indicator}">-->
<#--                        <#list groupData.groupData as podGroupData>-->
<#--                            <p type="button" data-bs-toggle="collapse" data-bs-target="#${podGroupData.indicator}" aria-expanded="false" aria-controls="collapseExample">-->
<#--                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">-->
<#--                                    <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>-->
<#--                                    <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>-->
<#--                                </svg>-->
<#--                                ${podGroupData.code} : ${podGroupData.value}-->
<#--                            </p>-->
<#--                            <div style="margin-left: 90px" class="collapse" id="${podGroupData.indicator}">-->
<#--                                <#list podGroupData.groupData as podGroupData2>-->
<#--                                    <p type="button" data-bs-toggle="collapse" data-bs-target="#${podGroupData2.indicator}" aria-expanded="false" aria-controls="collapseExample">-->
<#--                                        ${podGroupData2.code} : ${podGroupData2.value}-->
<#--                                    </p>-->
<#--&lt;#&ndash;                                    <div class="collapse" id="${podGroupData2.indicator}">&ndash;&gt;-->
<#--&lt;#&ndash;                                        пупуппу&ndash;&gt;-->
<#--&lt;#&ndash;                                    </div>&ndash;&gt;-->
<#--                                </#list>-->
<#--                            </div>-->
<#--                        </#list>-->
<#--                    </div>-->
<#--                </#list>-->
<#--            </div>-->
<#--        </#list>-->

<#--    </div>-->

    <div class="container" style="height: 100vh; width: 100vw; overflow-y: auto; position: relative; ">
        <span class="d-flex text-white justify-content-center h3" style="padding: 20px 0 20px 0; font-weight: bold">
            Единый классификатор болезней
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-capsule" viewBox="0 0 16 16">
              <path d="M1.828 8.9 8.9 1.827a4 4 0 1 1 5.657 5.657l-7.07 7.071A4 4 0 1 1 1.827 8.9Zm9.128.771 2.893-2.893a3 3 0 1 0-4.243-4.242L6.713 5.429l4.243 4.242Z"/>
            </svg>
        </span>

    <div class="container text-white" style="justify-content: center; width: 50vw; border-radius: 7px">
        <div class="accordion accordion-flush blurBG" id="accordionFlushExample" style="border-radius: 7px">
            <#list classes as class>
                <div class="accordion-item blurBG">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#${class.id}" aria-expanded="false" aria-controls="flush-collapseOne">
                            <p class="p-0 m-0"><span class="text-primary" style="padding-right: 10px">КЛАСС ${class.indicator}.</span>${class.value}</p>
                        </button>
                    </h2>
                    <div id="${class.id}" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                        <#list class.groupData as class1>
                            <p type="button" style="margin-left: 30px" data-bs-toggle="collapse" data-bs-target="#${class1.id}" aria-expanded="false" aria-controls="collapseExample">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">-->
                                    <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                    <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                                </svg>
                                ${class1.value}
                            </p>
                            <div class="collapse" id="${class1.id}">
                                <#list class1.groupData as mkdGroup>
                                    <p type="button" style="margin-left: 60px" data-bs-toggle="collapse" data-bs-target="#${mkdGroup.id}" aria-expanded="false" aria-controls="collapseExample">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">-->
                                            <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                                        </svg>
                                        ${mkdGroup.code} : ${mkdGroup.value}
                                    </p>
                                    <div class="collapse" id="${mkdGroup.id}">
                                        <#list mkdGroup.groupData as valueCode>
                                            <p style="margin-left: 90px">
                                                ${valueCode.code} : ${valueCode.value}
                                            </p>
                                        </#list>
                                    </div>
                                </#list>
                            </div>
                        </#list>
                    </div>
                </div>
            </#list>
        </div>
    </div>
    </div>



<#--    <#list classes as class>-->
<#--        <p data-bs-toggle="collapse" data-bs-target="#${class.id}" aria-expanded="false" aria-controls="collapseExample">-->
<#--            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">&ndash;&gt;-->
<#--                <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>-->
<#--                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>-->
<#--            </svg>-->
<#--            ${class.value}-->
<#--        </p>-->
<#--        <div class="collapse" id="${class.id}">-->
<#--           <#list class.groupData as class1>-->
<#--               <p data-bs-toggle="collapse" data-bs-target="#${class1.id}" aria-expanded="false" aria-controls="collapseExample">-->
<#--                   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">&ndash;&gt;-->
<#--                       <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>-->
<#--                       <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>-->
<#--                   </svg>-->
<#--                   ${class1.value}-->
<#--               </p>-->
<#--               <div class="collapse" id="${class1.id}">-->
<#--                   <#list class1.groupData as mkdGroup>-->
<#--                       <p data-bs-toggle="collapse" data-bs-target="#${mkdGroup.id}" aria-expanded="false" aria-controls="collapseExample">-->
<#--                           <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">&ndash;&gt;-->
<#--                               <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>-->
<#--                               <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>-->
<#--                           </svg>-->
<#--                           ${mkdGroup.code} : ${mkdGroup.value}-->
<#--                       </p>-->
<#--                       <div class="collapse" id="${mkdGroup.id}">-->
<#--                           <#list mkdGroup.groupData as valueCode>-->
<#--                               <p>-->
<#--                                   ${valueCode.code} : ${valueCode.value}-->
<#--                               </p>-->
<#--                           </#list>-->
<#--                       </div>-->
<#--                   </#list>-->
<#--               </div>-->
<#--           </#list>-->
<#--        </div>-->
<#--    </#list>-->

<#--    <#list classes as class>-->
<#--        <p>${class.value}</p>-->
<#--        <#list class.groupData as class1>-->
<#--            <p>${class1.value}</p>-->
<#--            <#list class1.groupData as mkdGroup>-->
<#--                <p>${mkdGroup.code} : ${mkdGroup.value}</p>-->
<#--                <#list mkdGroup.groupData as valueCode>-->
<#--                    <p>${valueCode.code} : ${valueCode.value}</p>-->
<#--                </#list>-->
<#--            </#list>-->
<#--        </#list>-->
<#--    </#list>-->


</@t.page>