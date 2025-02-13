package com.example.patientaccounting.services;

import com.example.patientaccounting.models.Report;
import com.example.patientaccounting.repository.ReportRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import java.io.ByteArrayOutputStream;
import java.sql.Blob;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class ReportService {

    private final ReportRepository reportRepository;

    public void saveReportByBD(Report report) {
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

    public List<Report> getReportList(LocalDate search_date) {
        if (search_date != null) return reportRepository.findByDate(search_date);
        return reportRepository.findAllReversed();
    }

    public List<String> getIdentityDate(List<Report> reports) {

        return reports.stream()
                .map(Report::getCreatedDate) // Конвертируем LocalDateTime в LocalDate
                .distinct() // Получаем уникальные даты
                .collect(Collectors.toList()); // Собираем в список
    }

    public List<String> getIdentityTime(List<Report> reports) {
        return reports.stream()
                .map(Report::getCreatedTime) // Конвертируем LocalDateTime в LocalDate
                .distinct() // Получаем уникальные даты
                .collect(Collectors.toList()); // Собираем в список
    }

    public ResponseEntity<byte[]> getViewReport(Long id) {

        byte[] bytes = getReportContent(id); // Преобразуем BLOB в массив байтов

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=report.xlsx")
                .contentType(MediaType.APPLICATION_OCTET_STREAM) // Меняем на корректный тип, если нужно
                .body(bytes);


    }

    public List<Report> getFilterReportByRangeData(LocalDate start_date, LocalDate end_date) {

        String inputDataStart = start_date.format(DateTimeFormatter.ofPattern("dd.MM.yyyy"));
        String inputDataEnd = end_date.format(DateTimeFormatter.ofPattern("dd.MM.yyyy"));

        String fullInputData = inputDataStart + " - " + inputDataEnd;

        return getReportList(null).stream().filter(report ->
                report.getFileName().equals(fullInputData)).toList();

    }

    public List<Report> getFilterByTypeReport(List<Report> reports, String type){
        return getReportList(null).stream().filter(report ->
                report.getTypeReport() != null && report.getTypeReport().equals(type)).toList();
    }

}
