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

@Controller
@RequiredArgsConstructor
@Slf4j
public class ReportController {

    private final ReportService reportService;

    @GetMapping("journal/report/get")
    public String report(Model model){
        model.addAttribute("reports", reportService.getReportList());
        model.addAttribute("dates", reportService.getIdentityDate());
        model.addAttribute("times", reportService.getIdentityTime());

        return "report";
    }

    @GetMapping("/journal/report/get/{id}")
    public ResponseEntity<byte[]> getReport(@PathVariable Long id) {
        return reportService.getReport(id);
    }
}
