package com.example.patientaccounting.services;

import com.example.patientaccounting.models.Journal;
import com.example.patientaccounting.repository.JournalRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.catalina.authenticator.SavedRequest;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class JournalService {

    private final JournalRepository journalRepository;
    private final MedicalService medicalService;

    public List<Journal> journalList(String fullName){
        if (fullName != null){
            List<Journal> journals = journalRepository.findByFullName(fullName);
            if (!journals.isEmpty())
                return journals;
        }
        return journalRepository.findAll();
    }

    public void saveRecord(Journal journal, String medical, String cause) {

        setMedicalCode(journal,medical,cause);
        journalRepository.save(journal);
        log.info("Save record with id = {}", journal.getId());
    }

    private void setMedicalCode(Journal journal, String medical, String cause){
        if (medical.isEmpty() && !cause.isEmpty()) return;
        journal.setMedical(
                medicalService.getMedicalByCode(medical)
        );
        journal.setCause_injury(
                medicalService.getMedicalByCode(cause)
        );
    }

    public Journal getLastRecord(){
        List<Journal> journals = new java.util.ArrayList<>(journalRepository.findAll().stream()
                .filter(
                        item -> item.getLocalDateAddRecord() != null && item.getLocalTimeAddRecord() != null
                )
                .toList());
        if (journals.isEmpty()) return null;

        journals.sort(Comparator.comparing(Journal::getLocalDateAddRecord)
                .thenComparing(Journal::getLocalTimeAddRecord));
        return journals.get(journals.size() - 1);
    }

    public void makeComparingJournal(String sort, List<Journal> journals){
        if (sort.equals("asc")) {
            journals.sort(Comparator.comparing(Journal::getDate_receipt)
                    .thenComparing(Journal::getString_time_receipt));
        } else if (sort.equals("desc")) {
            journals.sort(Comparator.comparing(Journal::getDate_receipt)
                    .thenComparing(Journal::getString_time_receipt).reversed());
        }
    }

    public void deleteRecord(Long id) {
        journalRepository.deleteById(id);
        log.info("Delete record with id = {}", id);
    }

    public Journal getRecordById(long id) {
        return journalRepository.findById(id).orElse(null);
    }

    public void editRecord(Journal journal, String medical, String cause) {

        if (journal != null) {
            Journal beforeJournal = journalRepository.findById(journal.getId()).orElse(null);

            assert beforeJournal != null;
            journal.setLocalDateAddRecord(beforeJournal.getLocalDateAddRecord());
            journal.setLocalTimeAddRecord(beforeJournal.getLocalTimeAddRecord());

            setMedicalCode(journal,medical,cause);
            journalRepository.save(journal);
            log.info("After edit record: {}", journal);
        }

    }

    public String getLocalTime(){

        int minute = LocalTime.now().getMinute();
        int hour = LocalTime.now().getHour();

        return String.format("%02d:%02d", hour, minute);
    }

    public String getNormalDate(LocalDate date){
        if (date != null){
            int day = date.getDayOfMonth();
            int mouth = date.getMonthValue();
            int year = date.getYear();
            return String.format("%02d.%02d.%04d", day, mouth, year);
        }
        else {
            return null;
        }

    }

    public LocalDateTime getAdmissionDateTime(LocalDate date, LocalTime time) {
        return LocalDateTime.of(date, time);
    }

    public List<Journal> getFilterByDate(LocalDate data1, LocalDate data2) {

        LocalTime time1 = LocalTime.of(8, 0);
        LocalTime time2 = LocalTime.of(7, 59);
        // Временной интервал
        LocalDateTime startDateTime = LocalDateTime.of(data1, time1);
        LocalDateTime endDateTime = LocalDateTime.of(data2, time2);

        log.info("Create report with data1 = {}, data2 = {}", getNormalDate(data1), getNormalDate(data2));

        return journalList(null).stream()
                .filter(journal ->
                        (!getAdmissionDateTime(journal.getDate_receipt(),LocalTime.parse(journal.getString_time_receipt()))
                                .isBefore(startDateTime))
                        && (!getAdmissionDateTime(journal.getDate_receipt(),LocalTime.parse(journal.getString_time_receipt()))
                                .isAfter(endDateTime))).toList();


    }
}
