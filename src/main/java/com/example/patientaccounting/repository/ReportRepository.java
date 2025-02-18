package com.example.patientaccounting.repository;

import com.example.patientaccounting.models.Report;
import org.springframework.data.jpa.repository.JpaRepository;
import java.time.LocalDate;
import java.util.Comparator;
import java.util.List;

public interface ReportRepository extends JpaRepository<Report, Long> {

    default List<Report> findByDate(LocalDate date) {
        List<Report> reports = new java.util.ArrayList<>(this.findAll().stream().filter(item ->
                item.getCreatedAt().toLocalDate().isEqual(date)).toList());

        reports.sort(Comparator.comparing(Report::getCreatedAt).reversed());

        return reports;
    }

    default List<Report> findAllReversed() {
        List<Report> reports = new java.util.ArrayList<>(this.findAll());
        reports.sort(Comparator.comparing(Report::getCreatedAt).reversed());
        return reports;
    }
}
