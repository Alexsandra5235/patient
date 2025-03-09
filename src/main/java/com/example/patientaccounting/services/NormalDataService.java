package com.example.patientaccounting.services;

import com.example.patientaccounting.models.Log;
import com.example.patientaccounting.models.NormalData;
import com.example.patientaccounting.models.Patients;
import com.example.patientaccounting.repository.NormalDataRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Service
@Slf4j
@RequiredArgsConstructor
public class NormalDataService {

    private final NormalDataRepository normalDataRepository;

    public void setNormalJournalData(NormalData normalData, Log log) {

        if (normalData == null || log == null) return;
        normalData.setStr_date_receipt(getNormalData(log.getDate_receipt()));
        normalData.setStr_date_time_alcohol(getNormalDataTime(log.getDate_time_alcohol()));
        normalData.setStr_date_time_inform(getNormalDataTime(log.getDate_time_inform()));
        normalData.setStr_local_date_time_discharge(getNormalDataTime(log.getLocal_date_time_discharge()));

        normalDataRepository.save(normalData);
        log.setNormal_data(normalData);

    }

    public void setNormalJournalData(NormalData normalData, Patients patient) {

        if (normalData == null || patient == null) return;
        normalData.setStr_birth_day(getNormalData(patient.getBirth_day()));

        normalDataRepository.save(normalData);
        patient.setNormal_data(normalData);

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
