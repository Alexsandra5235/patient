package com.example.patientaccounting.controllers;

import com.example.patientaccounting.models.Journal;
import com.example.patientaccounting.models.Report;
import com.example.patientaccounting.services.ReportService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Blob;
import java.time.LocalDate;
import java.util.Comparator;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ReportController {

    private final ReportService reportService;

    @GetMapping("journal/report/get")
    public String report(@RequestParam(name = "search_date", required = false) LocalDate search_date,
                         @RequestParam(name = "valueSelect", required = false) String valueSelect,  Model model){

        model.addAttribute("reports", reportService.getReportList(search_date));

        if (search_date != null) {
            model.addAttribute("search_date", search_date);
        }
        if (valueSelect != null){
            log.info(valueSelect);
            model.addAttribute("valueSelect", valueSelect);
        } else {
            model.addAttribute("valueSelect", "null");
        }

        model.addAttribute("dates", reportService.getIdentityDate(search_date));
        model.addAttribute("times", reportService.getIdentityTime(search_date));

        return "report";
    }

    @GetMapping("/journal/report/get/{id}")
    public ResponseEntity<byte[]> getReport(@PathVariable Long id) {
        return reportService.getReport(id);
    }

    @GetMapping("/viewReport/{id}")
    public ResponseEntity<byte[]> viewReport(@PathVariable Long id) {
        return reportService.getViewReport(id);
    }
}
