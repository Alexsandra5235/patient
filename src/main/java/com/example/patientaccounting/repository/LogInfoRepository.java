package com.example.patientaccounting.repository;

import com.example.patientaccounting.models.LogInfo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LogInfoRepository extends JpaRepository<LogInfo, Long> {

    default LogInfo findJournalInfoByLogId(Long journal_id) {
        return this.findAll().stream()
                .filter(logInfo -> logInfo.getLog().getId().equals(journal_id))
                .findFirst().orElse(null);
    }
}
