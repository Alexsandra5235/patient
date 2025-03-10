package com.example.patientaccounting.services;

import com.example.patientaccounting.models.LogReceipt;
import com.example.patientaccounting.models.NormalData;
import com.example.patientaccounting.repository.LogReceiptRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class LogReceiptService {

    private final LogReceiptRepository logReceiptRepository;
    private final NormalDataService normalDataService;

    public void saveLogReceipt(LogReceipt logReceipt, NormalData normalData) {
        if (logReceipt == null) return;
        setNormalData(logReceipt, normalData);
        logReceiptRepository.save(logReceipt);
    }

    private void setNormalData(LogReceipt logReceipt, NormalData normalData) {
        if (normalData == null) return;
        normalData.setStr_date_receipt(normalDataService.getNormalData(logReceipt.getDate_receipt()));
        normalData.setStr_date_time_alcohol(normalDataService.getNormalDataTime(logReceipt.getDate_time_alcohol()));
    }
}
