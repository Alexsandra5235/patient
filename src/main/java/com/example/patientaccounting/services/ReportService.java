package com.example.patientaccounting.services;

import com.example.patientaccounting.models.Report;
import com.example.patientaccounting.repository.ReportRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import java.io.ByteArrayOutputStream;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class ReportService {

    private final ReportRepository reportRepository;

    public void saveReportByBD(Report report){
        reportRepository.save(report);
    }

    public byte[] getReportContent(Long id) {
        Report report = reportRepository.findById(id).orElse(null);
        return report != null ? report.getFileContent() : null;
    }

    public ResponseEntity<byte[]> getReport(Long id) {
        byte[] reportContent = getReportContent(id);
        if (reportContent == null) {
            return ResponseEntity.notFound().build();
        }

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attachment; filename=report.xlsx");
        return new ResponseEntity<>(reportContent, headers, HttpStatus.OK);
    }

    public List<Report> getReportList()
    {
        return reportRepository.findAll();
    }

    public List<LocalDate> getIdentityDate() {
        List<Report> reports = getReportList();

        return reports.stream()
                .map(report -> report.getCreatedAt().toLocalDate()) // Конвертируем LocalDateTime в LocalDate
                .distinct() // Получаем уникальные даты
                .collect(Collectors.toList()); // Собираем в список
    }

    public List<LocalTime> getIdentityTime() {
        List<Report> reports = getReportList();

        return reports.stream()
                .map(report -> report.getCreatedAt().toLocalTime()) // Конвертируем LocalDateTime в LocalDate
                .distinct() // Получаем уникальные даты
                .collect(Collectors.toList()); // Собираем в список
    }


}
