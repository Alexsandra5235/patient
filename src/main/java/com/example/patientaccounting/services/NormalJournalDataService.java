package com.example.patientaccounting.services;

import com.example.patientaccounting.models.Journal;
import com.example.patientaccounting.models.NormalJournalData;
import com.example.patientaccounting.models.Patients;
import com.example.patientaccounting.repository.NormalJournalDataRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Service
@Slf4j
@RequiredArgsConstructor
public class NormalJournalDataService {

    private final NormalJournalDataRepository normalJournalDataRepository;

    public void setNormalJournalData(NormalJournalData normalJournalData, Journal journal) {

        if (normalJournalData == null || journal == null) return;
        normalJournalData.setStr_date_receipt(getNormalData(journal.getDate_receipt()));
        normalJournalData.setStr_date_time_alcohol(getNormalDataTime(journal.getDate_time_alcohol()));
        normalJournalData.setStr_date_time_inform(getNormalDataTime(journal.getDate_time_inform()));
        normalJournalData.setStr_local_date_time_discharge(getNormalDataTime(journal.getLocal_date_time_discharge()));

        normalJournalDataRepository.save(normalJournalData);
        journal.setNormal_data(normalJournalData);

    }

    public void setNormalJournalData(NormalJournalData normalJournalData, Patients patient) {

        if (normalJournalData == null || patient == null) return;
        normalJournalData.setStr_birth_day(getNormalData(patient.getBirth_day()));

        normalJournalDataRepository.save(normalJournalData);
        patient.setNormal_data(normalJournalData);

    }

    public String getNormalData(LocalDate data){
        if (data == null) return null;

        int yearDischarge = data.getYear();
        int monthDischarge = data.getMonthValue();
        int dayDischarge = data.getDayOfMonth();

        return String.format("%02d.%02d.%04d", dayDischarge, monthDischarge, yearDischarge);
    }

    public String getNormalDataTime(LocalDateTime data){
        if (data == null) return null;

        int yearDischarge = data.getYear();
        int monthDischarge = data.getMonthValue();
        int dayDischarge = data.getDayOfMonth();

        int hour = data.getHour();
        int minute = data.getMinute();

        return String.format("%02d.%02d.%04d %02d:%02d", dayDischarge, monthDischarge, yearDischarge, hour, minute);
    }
}
