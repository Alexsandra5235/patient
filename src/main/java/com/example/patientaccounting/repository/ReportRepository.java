package com.example.patientaccounting.repository;

import com.example.patientaccounting.models.Medical;
import com.example.patientaccounting.models.Report;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface ReportRepository extends JpaRepository<Report, Long> {

    default List<Report> findByDate(LocalDate date) {
        return this.findAll().stream().filter(item ->
                item.getCreatedAt().toLocalDate().isAfter(date) || item.getCreatedAt().toLocalDate().isEqual(date)).toList();
    }
}
