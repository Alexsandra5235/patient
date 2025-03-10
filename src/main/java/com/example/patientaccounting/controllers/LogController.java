package com.example.patientaccounting.controllers;

import com.example.patientaccounting.models.*;
import com.example.patientaccounting.services.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import static com.example.patientaccounting.Constants.*;


@Controller
@RequiredArgsConstructor
@Slf4j
public class LogController {

    private final LogService logService;
    private final JournalExportExcel journalExportExcel;
    private final MedicalService medicalService;
    private final NormalDataService normalDataService;
    private final LogInfoService logInfoService;

    @GetMapping("/")
    public String journal(@RequestParam(name = "full_name", required = false) String fullName,
                          @RequestParam(name = "sortData", required = false, defaultValue = "desc") String sort,
                          Model model) {

        List<Log> logs = logService.getLogList(fullName);
        Log lastLogAdd = logService.getLastRecord();

        if (log != null) model.addAttribute("lastLogAdd", lastLogAdd);

        if (fullName != null) model.addAttribute("full_name", fullName);

        model.addAttribute("sort", sort);

        if (sort != null) logService.getSortedLogs(sort, logs);

        if (logs == null) model.addAttribute("logs", logService.getLogList(fullName));
        else model.addAttribute("logs", logs);

        return "journal";
    }

    @GetMapping("/log/save")
    public String saveJournal(Model model) {
        String full_time = String.format(LocalDate.now() + " " + logService.getLocalTime());

        model.addAttribute("date_now", LocalDate.now());
        model.addAttribute("time_now", logService.getLocalTime());
        model.addAttribute("full_time", full_time);

        model.addAttribute("options", options);
        model.addAttribute("optionsGender", optionsGender);
        model.addAttribute("optionsDelivered", optionsDelivered);
        model.addAttribute("optionsReason", optionsReason);
        return "addJournal";
    }

    @PostMapping("/log/add")
    public String addJournal(Log log, Patients patient, LogReceipt logReceipt, LogDischarge logDischarge,
                             @RequestParam(name = "medical_str", required = false) String medical,
                             @RequestParam(name = "cause_injury_str", required = false) String cause) {
        logService.saveRecord(log, patient, logReceipt, logDischarge, medical,cause);
        return "redirect:/";
    }



    @GetMapping("/log/edit/{id}")
    public String editJournal(@PathVariable Long id, Model model) {

        Log log = logService.getRecordById(id);
        LogInfo logInfo = logInfoService.getLogInfoByLogId(id);

        model.addAttribute("log", log);
        model.addAttribute("options", options);
        model.addAttribute("optionsGender", optionsGender);
        model.addAttribute("optionsDelivered", optionsDelivered);
        model.addAttribute("optionsReason", optionsReason);
        model.addAttribute("datetime_create_record", normalDataService.getNormalDataTime(logInfo.getDate_time_create_record()));
        model.addAttribute("datetime_edit_record", normalDataService.getNormalDataTime(logInfo.getDate_time_edit_record()));

        return "edit";
    }

    @PostMapping("/log/save/edit/{id}")
    public String saveEditJournal(Log log, Patients patient, LogReceipt logReceipt, LogDischarge logDischarge,
                                  @RequestParam(name = "medical_str", required = false) String medical,
                                  @RequestParam(name = "cause_injury_str", required = false) String cause) {
        logService.editRecord(log, patient, logReceipt, logDischarge, medical, cause);
        return "redirect:/";
    }

    @PostMapping("/log/delete/{id}")
    public String deleteJournal(@PathVariable Long id) {
        logService.deleteRecord(id);
        return "redirect:/";
    }

    @GetMapping("/mkd/info")
    public String medicalInfo(Model model) throws Exception {
        model.addAttribute("medicals", medicalService.getMedicals());
        model.addAttribute("classes", medicalService.getClassMkd());
        model.addAttribute("size", medicalService.getClassMkd().size());

        return "mkd";
    }

    @GetMapping("/export/excel")
    public ResponseEntity<byte[]> openToExcel(@RequestParam(name = "data1", required = false) LocalDate data1,
                                              @RequestParam(name = "data2", required = false) LocalDate data2,
                                              @RequestParam(name = "typeReport", required = false) String typeReport,
                                              @RequestParam(name = "open", required = false) String open)
                                              throws IOException {

        List<Log> logs = logService.getFilterByDate(data1, data2);

        if (open != null) {
            return journalExportExcel.openToExcel(logs, logService.getNormalDate(data1), logService.getNormalDate(data2));
        } else {
            return journalExportExcel.exportToExcel(logs, logService.getNormalDate(data1), logService.getNormalDate(data2), typeReport);

        }
    }

    @GetMapping("/log/info/{id}")
    public String infoJournal(@PathVariable Long id, Model model) {
        Log log = logService.getRecordById(id);
        LogInfo logInfo = logInfoService.getLogInfoByLogId(id);

        model.addAttribute("log", log);
        model.addAttribute("option", options.get(1));
        model.addAttribute("datetime_create_record", normalDataService.getNormalDataTime(logInfo.getDate_time_create_record()));
        model.addAttribute("datetime_edit_record", normalDataService.getNormalDataTime(logInfo.getDate_time_edit_record()));
        return "infoJournal";
    }

    @GetMapping("/log/excel/day")
    public String dayReport(){
        return "dayReport";
    }

    @GetMapping("/log/excel/month")
    public String monthReport(){
        return "monthReport";
    }




}
