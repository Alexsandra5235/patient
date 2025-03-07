package com.example.patientaccounting.controllers;

import com.example.patientaccounting.models.Patients;
import com.example.patientaccounting.models.Report;
import com.example.patientaccounting.services.*;
import com.example.patientaccounting.models.Journal;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Comparator;
import java.util.List;

import static com.example.patientaccounting.Constants.*;


@Controller
@RequiredArgsConstructor
@Slf4j
public class JournalController {

    private final JournalService journalService;
    private final JournalExportExcel journalExportExcel;
    private final MedicalService medicalService;
    private final NormalJournalDataService normalJournalDataService;

    @GetMapping("/")
    public String journal(@RequestParam(name = "full_name", required = false) String fullName,
                          @RequestParam(name = "sortData", required = false, defaultValue = "desc") String sort,
                          Model model) {

        List<Journal> journals = journalService.journalList(fullName);
        Journal journal = journalService.getLastRecord();

        if (journal != null) model.addAttribute("lastJournal", journal);

        if (fullName != null) model.addAttribute("full_name", fullName);

        model.addAttribute("sort", sort);

        if (sort != null) journalService.makeComparingJournal(sort,journals);

        model.addAttribute("journals", journals);

        return "journal";
    }

    @GetMapping("/journal/save")
    public String saveJournal(Model model) {
        String full_time = String.format(LocalDate.now() + " " + journalService.getLocalTime());

        model.addAttribute("date_now", LocalDate.now());
        model.addAttribute("time_now", journalService.getLocalTime());
        model.addAttribute("full_time", full_time);

        model.addAttribute("options", options);
        model.addAttribute("optionsGender", optionsGender);
        model.addAttribute("optionsDelivered", optionsDelivered);
        model.addAttribute("optionsReason", optionsReason);
        return "addJournal";
    }

    @PostMapping("/journal/add")
    public String addJournal(Journal journal, Patients patient,
                             @RequestParam(name = "medical_str", required = false) String medical,
                             @RequestParam(name = "cause_injury_str", required = false) String cause) {
        journalService.saveRecord(journal, patient, medical,cause);
        return "redirect:/";
    }



    @GetMapping("/journal/edit/{id}")
    public String editJournal(@PathVariable Long id, Model model) {

        Journal journal = journalService.getRecordById(id);
        model.addAttribute("journal", journal);
        model.addAttribute("options", options);
        model.addAttribute("optionsGender", optionsGender);
        model.addAttribute("optionsDelivered", optionsDelivered);
        model.addAttribute("optionsReason", optionsReason);
        model.addAttribute("datetime_create_record", normalJournalDataService.getNormalDataTime(journal.getJournalInfo().getDate_time_create_record()));
        model.addAttribute("datetime_edit_record", normalJournalDataService.getNormalDataTime(journal.getJournalInfo().getDate_time_edit_record()));

        return "edit";
    }

    @PostMapping("/journal/save/edit/{id}")
    public String saveEditJournal(Journal journal, Patients patient,
                                  @RequestParam(name = "medical_str", required = false) String medical,
                                  @RequestParam(name = "cause_injury_str", required = false) String cause) {
        journalService.editRecord(journal, patient, medical, cause);
        return "redirect:/";
    }

    @PostMapping("/journal/delete/{id}")
    public String deleteJournal(@PathVariable Long id) {
        journalService.deleteRecord(id);
        return "redirect:/";
    }

    @GetMapping("/mkd/info")
    public String medicalInfo(Model model) throws Exception {
        model.addAttribute("medicals", medicalService.getMedicals());
        model.addAttribute("classes", medicalService.getClassMkd());
        model.addAttribute("size", medicalService.getClassMkd().size());

        return "mkd";
    }

//    @GetMapping("/export/excel")
//    public ResponseEntity<byte[]> exportToExcel(@RequestParam(name = "data1", required = false) LocalDate data1,
//                                                @RequestParam(name = "data2", required = false) LocalDate data2,
//                                                @RequestParam(name = "typeReport", required = false) String typeReport) throws IOException {
//
//        List<Journal> journals = journalService.getFilterByDate(data1, data2);
//
//        return journalExportExcel.exportToExcel(journals, journalService.getNormalDate(data1), journalService.getNormalDate(data2), typeReport);
//    }

    @GetMapping("/export/excel")
    public ResponseEntity<byte[]> openToExcel(@RequestParam(name = "data1", required = false) LocalDate data1,
                                              @RequestParam(name = "data2", required = false) LocalDate data2,
                                              @RequestParam(name = "typeReport", required = false) String typeReport,
                                              @RequestParam(name = "open", required = false) String open)
                                              throws IOException {

        List<Journal> journals = journalService.getFilterByDate(data1, data2);

        if (open != null) {
            return journalExportExcel.openToExcel(journals, journalService.getNormalDate(data1), journalService.getNormalDate(data2));
        } else {
            return journalExportExcel.exportToExcel(journals, journalService.getNormalDate(data1), journalService.getNormalDate(data2), typeReport);

        }
    }

    @GetMapping("/journal/info/{id}")
    public String infoJournal(@PathVariable Long id, Model model) {
        Journal journal = journalService.getRecordById(id);
        model.addAttribute("journal", journal);
        model.addAttribute("option", options.get(1));
        model.addAttribute("datetime_create_record", normalJournalDataService.getNormalDataTime(journal.getJournalInfo().getDate_time_create_record()));
        model.addAttribute("datetime_edit_record", normalJournalDataService.getNormalDataTime(journal.getJournalInfo().getDate_time_edit_record()));
        return "infoJournal";
    }

    @GetMapping("/journal/excel/day")
    public String dayReport(){
        return "dayReport";
    }

    @GetMapping("/journal/excel/month")
    public String monthReport(){
        return "monthReport";
    }




}
