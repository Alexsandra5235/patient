package com.example.patientaccounting.controllers;

import com.example.patientaccounting.JournalExportExcel;
import com.example.patientaccounting.models.Journal;
import com.example.patientaccounting.services.JournalService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.chrono.ChronoLocalDate;
import java.time.chrono.ChronoLocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
@Slf4j
public class JournalController {

    private final JournalService journalService;
    private final JournalExportExcel journalExportExcel = new JournalExportExcel();

    @GetMapping("/")
    public String journal(@RequestParam(name = "full_name", required = false) String fullName, Model model) {

        model.addAttribute("journals", journalService.journalList(fullName));
        model.addAttribute("date_now", LocalDate.now());
        model.addAttribute("time_now", journalService.getLocalTime());
        if (fullName != null) {
            model.addAttribute("full_name", fullName);
        }
        return "journal";
    }

    @PostMapping("/journal/save")
    public String saveJournal(Journal journal) {
        journalService.saveRecord(journal);
        return "redirect:/";
    }



    @GetMapping("/journal/edit/{id}")
    public String editJournal(@PathVariable Long id, Model model) {
        model.addAttribute("journal", journalService.getRecordById(id));
        return "edit";
    }

    @PostMapping("/journal/save/edit/{id}")
    public String saveEditJournal(@PathVariable Long id,Journal journal) {
        journalService.editRecord(journal);
        return "redirect:/";
    }

    @PostMapping("/journal/delete/{id}")
    public String deleteJournal(@PathVariable Long id) {
        journalService.deleteRecord(id);
        return "redirect:/";
    }

    @GetMapping("/export/excel")
    public ResponseEntity<byte[]> exportToExcel(@RequestParam(name = "data1", required = false) LocalDate data1,
                                                @RequestParam(name = "data2", required = false) LocalDate data2) throws IOException {

        List<Journal> journals = journalService.getFilterByDate(data1, data2);

        return journalExportExcel.exportToExcel(journals, journalService.getNormalDate(data1), journalService.getNormalDate(data2));
    }




}
