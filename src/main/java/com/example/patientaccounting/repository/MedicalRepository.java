package com.example.patientaccounting.repository;

import com.example.patientaccounting.models.Journal;
import com.example.patientaccounting.models.Medical;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MedicalRepository extends JpaRepository<Medical, String> {
}
