package com.example.patientaccounting.repository;

import com.example.patientaccounting.models.NormalJournalData;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NormalJournalDataRepository extends JpaRepository<NormalJournalData, Long> {
}
