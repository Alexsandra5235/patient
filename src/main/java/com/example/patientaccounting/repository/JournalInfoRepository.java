package com.example.patientaccounting.repository;

import com.example.patientaccounting.models.JournalInfo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JournalInfoRepository extends JpaRepository<JournalInfo, Long> {

    default JournalInfo findJournalInfoByJournal_id(Long journal_id) {
        return this.findAll().stream()
                .filter(journalInfo -> journalInfo.getJournal().getId().equals(journal_id))
                .findFirst().orElse(null);
    }
}
