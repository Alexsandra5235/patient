package com.example.patientaccounting.services;

import com.example.patientaccounting.models.Log;
import com.example.patientaccounting.models.LogReceipt;
import com.example.patientaccounting.models.NormalData;
import com.example.patientaccounting.models.Patients;
import com.example.patientaccounting.repository.LogRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import static java.util.Comparator.nullsLast;

@Service
@Slf4j
@RequiredArgsConstructor
public class LogService {

    private final LogRepository logRepository;
    private final MedicalService medicalService;
    private final NormalDataService normalDataService;
    private final LogInfoService logInfoService;
    private final PatientsService patientsService;
    private final LogReceiptService logReceiptService;

    public List<Log> getLogList(String fullName){
        if (fullName != null){
            List<Log> logs = logRepository.findByFullName(fullName);
            if (!logs.isEmpty())
                return logs;
        }
        return logRepository.findAll();
    }

    public void saveRecord(Log log, Patients patient, LogReceipt logReceipt, String medical, String cause) {

        NormalData normalData = new NormalData();

        setMedicalCode(null, log, medical,cause);
        patientsService.savePatient(patient, normalData);
        log.setPatient(patient);
        logReceiptService.saveLogReceipt(logReceipt, normalData);
        log.setLog_receipt(logReceipt);
        setNormalData(normalData,log);
        log.setNormal_data(normalData);
        logRepository.save(log);
        logInfoService.saveLogInfo(log);
        LogService.log.info("Save record with id = {}", log.getId());
    }

    private void setNormalData(NormalData normalData, Log log) {
        normalData.setStr_date_time_inform(normalDataService.getNormalDataTime(log.getDate_time_inform()));
        normalData.setStr_local_date_time_discharge(normalDataService.getNormalDataTime(log.getLocal_date_time_discharge()));
    }

    private void setMedicalCode(Log beforeLog, Log log, String medical, String cause){

        if (beforeLog != null){
            if (beforeLog.getMedical() != null) log.setMedical(beforeLog.getMedical());
            if (beforeLog.getCause_injury() != null) log.setCause_injury(beforeLog.getCause_injury());
        }

        if (!medical.isEmpty()) log.setMedical(medicalService.getMedicalByCode(medical));
        if (!cause.isEmpty()) log.setCause_injury(medicalService.getMedicalByCode(cause));

    }

    public Log getLastRecord(){
//        List<Log> journals = new java.util.ArrayList<>(logRepository.findAll().stream()
//                .filter(
//                        item -> item.getLocalDateAddRecord() != null && item.getLocalTimeAddRecord() != null
//                )
//                .toList());
//        if (journals.isEmpty()) return null;
//
//        journals.sort(Comparator.comparing(Log::getLocalDateAddRecord)
//                .thenComparing(Log::getLocalTimeAddRecord));
//        return journals.get(journals.size() - 1);
        return null;
    }

    public void getSortedLogs(String sort, List<Log> logs) {

        if (sort.equals("asc")){
            logs.sort(Comparator
                    .comparing((Log log) -> log.getLog_receipt() != null ? log.getLog_receipt().getDate_receipt() : null)
                    .thenComparing(log -> log.getLog_receipt() != null ? log.getLog_receipt().getString_time_receipt() : null));
        } else if (sort.equals("desc")) {
            logs.sort(Comparator
                    .comparing((Log log) -> log.getLog_receipt() != null ? log.getLog_receipt().getDate_receipt() : null)
                    .reversed()
                    .thenComparing(log -> log.getLog_receipt() != null ? log.getLog_receipt().getString_time_receipt() : null)
                    .reversed());
        }

    }

    public void deleteRecord(Long id) {
        logInfoService.deleteByLogId(id);
        logRepository.deleteById(id);
        log.info("Delete record with id = {}", id);
    }

    public Log getRecordById(long id) {
        return logRepository.findById(id).orElse(null);
    }

    public void editRecord(Log log, Patients patient, LogReceipt logReceipt, String medical, String cause) {

        if (log == null) return;

        Log beforeLog = logRepository.findById(log.getId()).orElse(null);

        if (beforeLog == null) return;

        NormalData normalData = beforeLog.getNormal_data();

        setMedicalCode(beforeLog, log,medical,cause);
        normalDataService.setNormalJournalData(normalData, log);
        patientsService.savePatient(patient, normalData);
        log.setPatient(patient);
        logReceiptService.saveLogReceipt(logReceipt, normalData);
        log.setLog_receipt(logReceipt);
        logRepository.save(log);
        logInfoService.editLogInfo(log, beforeLog);
        LogService.log.info("After edit record: {}", log);


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

    public List<Log> getFilterByDate(LocalDate data1, LocalDate data2) {

        LocalTime time1 = LocalTime.of(8, 0);
        LocalTime time2 = LocalTime.of(7, 59);
        // Временной интервал
        LocalDateTime startDateTime = LocalDateTime.of(data1, time1);
        LocalDateTime endDateTime = LocalDateTime.of(data2, time2);

        log.info("Create report with data1 = {}, data2 = {}", getNormalDate(data1), getNormalDate(data2));

        return getLogList(null).stream()
                .filter(journal ->
                        (!getAdmissionDateTime(journal.getLog_receipt().getDate_receipt(),LocalTime.parse(journal.getLog_receipt().getString_time_receipt()))
                                .isBefore(startDateTime))
                        && (!getAdmissionDateTime(journal.getLog_receipt().getDate_receipt(),LocalTime.parse(journal.getLog_receipt().getString_time_receipt()))
                                .isAfter(endDateTime))).toList();


    }
}
