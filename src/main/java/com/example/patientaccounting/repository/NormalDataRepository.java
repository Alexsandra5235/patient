package com.example.patientaccounting.repository;

import com.example.patientaccounting.models.NormalData;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NormalDataRepository extends JpaRepository<NormalData, Long> {
}
