package com.example.patientaccounting.repository;

import com.example.patientaccounting.models.Medical;
import com.example.patientaccounting.models.Report;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReportRepository extends JpaRepository<Report, Long> {
}
