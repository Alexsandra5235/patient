package com.example.patientaccounting.repository;

import com.example.patientaccounting.models.Procedures;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProceduresRepository extends JpaRepository<Procedures, Long> {
}
