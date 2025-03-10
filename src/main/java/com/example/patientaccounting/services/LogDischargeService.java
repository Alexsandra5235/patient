package com.example.patientaccounting.services;

import com.example.patientaccounting.models.Log;
import com.example.patientaccounting.models.LogDischarge;
import com.example.patientaccounting.models.NormalData;
import com.example.patientaccounting.repository.LogDischargeRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class LogDischargeService {

    private final LogDischargeRepository logDischargeRepository;
    private final NormalDataService normalDataService;

    public void saveLogDischarge(LogDischarge logDischarge, NormalData normalData) {
        if (logDischarge == null) return;
        setNormalData(normalData, logDischarge);
        logDischargeRepository.save(logDischarge);
    }

    private void setNormalData(NormalData normalData, LogDischarge logDischarge) {
        normalData.setStr_date_time_inform(normalDataService.getNormalDataTime(logDischarge.getDate_time_inform()));
        normalData.setStr_local_date_time_discharge(normalDataService.getNormalDataTime(logDischarge.getLocal_date_time_discharge()));
    }
}
