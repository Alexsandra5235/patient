package com.example.patientaccounting.controllers;

import com.example.patientaccounting.models.Report;
import com.example.patientaccounting.services.ReportService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ReportController {

    private final ReportService reportService;

    @GetMapping("/log/report/get")
    public String report(@RequestParam(name = "search_date", required = false) LocalDate search_date,
                         @RequestParam(name = "valueSelect", required = false) String valueSelect,
                         @RequestParam(name = "start_data", required = false) LocalDate start_data,
                         @RequestParam(name = "end_data", required = false) LocalDate end_data,
                         @RequestParam(value = "flexRadioDefault", required = false) String radioButton, Model model){


        List<Report> reports = reportService.getReportList(search_date);

        if (search_date != null) {
            model.addAttribute("search_date", search_date);
        }
        if (start_data != null){
            model.addAttribute("start_data", start_data);
            model.addAttribute("end_data", end_data);
            reports = reportService.getFilterReportByRangeData(start_data, end_data);
        }
        if(radioButton != null){
            model.addAttribute("radioButton", radioButton);
            if(radioButton.equals("day")){
                reports = reportService.getFilterByTypeReport("Ежедневный отчет");
            } else {
                reports = reportService.getFilterByTypeReport("Ежемесячный отчет");
            }
        }

        model.addAttribute("valueSelect", Objects.requireNonNullElse(valueSelect, "null"));

        model.addAttribute("reports", reports);
        model.addAttribute("dates", reportService.getIdentityDate(reports));
        model.addAttribute("times", reportService.getIdentityTime(reports));

        return "report";
    }

    @GetMapping("/log/report/get/{id}")
    public ResponseEntity<byte[]> getReport(@PathVariable Long id) {
        return reportService.getReport(id);
    }

    @GetMapping("/viewReport/{id}")
    public ResponseEntity<byte[]> viewReport(@PathVariable Long id) {
        return reportService.getViewReport(id);
    }
}
