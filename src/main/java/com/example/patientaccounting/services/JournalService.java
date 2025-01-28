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
        log.info(fullName);
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
            //journal.setNormal_date_outcome(getNormalDate(journal.getDate_time_discharge().toLocalDate()));
            journalRepository.save(journal);
            log.info("After edit record: {}", journal.toString());
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
