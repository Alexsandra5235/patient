package com.example.patientaccounting.services;

import com.example.patientaccounting.models.Journal;
import com.example.patientaccounting.repository.JournalRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class JournalService {

    private final JournalRepository journalRepository;

    public List<Journal> journalList(String fullName){
        if (fullName != null) return journalRepository.findByFullName(fullName);
        return journalRepository.findAll();
    }

    public void saveRecord(Journal journal) {
        journalRepository.save(journal);
        log.info("Save record with id = {}", journal.getId());
    }

    public void deleteRecord(Long id) {
        journalRepository.deleteById(id);
        log.info("Delete record with id = {}", id);
    }

    public Journal getRecordById(long id) {
        return journalRepository.findById(id).orElse(null);
    }

    public void editRecord(Journal journal) {

        if (journal != null) {
            Journal beforeJournal = journalRepository.findById(journal.getId()).orElse(null);
            log.info("Edit record with id = {}", journal.getId());
            assert beforeJournal != null;
            log.info("Before edit record: {}", beforeJournal.toString());
            journal.setNormal_date(getNormalDate(journal.getDate_receipt()));
            journal.setNormal_birth_day(getNormalDate(journal.getBirth_day()));
            journalRepository.save(journal);
            log.info("After edit record: {}", journal.toString());
        }

    }

    public List<LocalDate> getRecordDate() {
        return journalRepository.findAll().stream().map(Journal::getDate_receipt).toList();
    }

    public String getNormalDate(LocalDate date){
        int day = date.getDayOfMonth();
        int mouth = date.getMonthValue();
        int year = date.getYear();
        return String.format("%02d.%02d.%04d", day, mouth, year);
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

//        // Поиск пациентов в заданном интервале
//        for (journalList(null) patient : journal) {
//            LocalDateTime admissionDateTime = patient.getAdmissionDateTime();
//            if (!admissionDateTime.isBefore(startDateTime) && !admissionDateTime.isAfter(endDateTime)) {
//                System.out.println(patient.getName() + " поступил в " + admissionDateTime);
//            }
//        }

//        return journalList(null).stream()
//                .filter(journal -> ((journal.getDate_receipt().isAfter(data1)) || (journal.getDate_receipt().isEqual(data1)))
//                        && ((journal.getTime_receipt().isAfter(time1)))
//                        && ((journal.getTime_receipt().isBefore(time2)))
//                        && ((journal.getDate_receipt().isBefore(data2)) || (journal.getDate_receipt().isEqual(data2)))).toList();

        return journalList(null).stream()
                .filter(journal ->
                        (!getAdmissionDateTime(journal.getDate_receipt(),journal.getTime_receipt())
                                .isBefore(startDateTime))
                        && (!getAdmissionDateTime(journal.getDate_receipt(),journal.getTime_receipt())
                                .isAfter(endDateTime))).toList();


    }
}
