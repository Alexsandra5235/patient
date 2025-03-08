package com.example.patientaccounting.repository;

import com.example.patientaccounting.models.Patients;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PatientsRepository extends JpaRepository<Patients, Long> {
}
