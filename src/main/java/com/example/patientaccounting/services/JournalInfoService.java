package com.example.patientaccounting.services;

import com.example.patientaccounting.models.Journal;
import com.example.patientaccounting.models.JournalInfo;
import com.example.patientaccounting.repository.JournalInfoRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
@Slf4j
@RequiredArgsConstructor
public class JournalInfoService {

    private final JournalInfoRepository journalInfoRepository;

    public void saveJournalInfo(Journal journal) {
        JournalInfo journalInfo = new JournalInfo();
        journalInfo.setJournal(journal);
        journalInfoRepository.save(journalInfo);
    }

    public void editJournalInfo(Journal journal, Journal beforeJournal) {
        JournalInfo journalInfo = journalInfoRepository.findJournalInfoByJournal_id(beforeJournal.getId());
        journalInfo.setJournal(journal);
        journalInfo.setDate_time_edit_record(LocalDateTime.now());
        journalInfoRepository.save(journalInfo);
    }
}
