package com.example.patientaccounting.controllers;

import com.example.patientaccounting.services.ReportService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ReportController {

    private final ReportService reportService;

    @GetMapping("journal/report/get")
    public String report(@RequestParam(name = "search_date", required = false) LocalDate search_date, Model model){
        model.addAttribute("reports", reportService.getReportList(search_date));

        if (search_date != null) {
            model.addAttribute("search_date", search_date);
        }

        model.addAttribute("dates", reportService.getIdentityDate(search_date));
        model.addAttribute("times", reportService.getIdentityTime(search_date));

        if (!reportService.getReportList(search_date).isEmpty()) {
            model.addAttribute("endReport", reportService.getReportList(search_date).get(reportService.getReportList(search_date).size()-1));
        }

        return "report";
    }

    @GetMapping("/journal/report/get/{id}")
    public ResponseEntity<byte[]> getReport(@PathVariable Long id) {
        return reportService.getReport(id);
    }
}
