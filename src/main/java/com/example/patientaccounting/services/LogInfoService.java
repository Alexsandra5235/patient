package com.example.patientaccounting.services;

import com.example.patientaccounting.models.Log;
import com.example.patientaccounting.models.LogInfo;
import com.example.patientaccounting.repository.LogInfoRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
@Slf4j
@RequiredArgsConstructor
public class LogInfoService {

    private final LogInfoRepository logInfoRepository;

    public void saveLogInfo(Log log) {
        LogInfo logInfo = new LogInfo();
        logInfo.setLog(log);
        logInfoRepository.save(logInfo);
    }

    public void editLogInfo(Log log, Log beforeLog) {
        LogInfo logInfo = getLogInfoByLogId(beforeLog.getId());
        logInfo.setLog(log);
        logInfo.setDate_time_edit_record(LocalDateTime.now());
        logInfoRepository.save(logInfo);
    }

    public LogInfo getLogInfoByLogId(Long id) {
        return logInfoRepository.findJournalInfoByLogId(id);
    }

    public void deleteByLogId(Long id){
        Long idLongInfo = getLogInfoByLogId(id).getId();
        logInfoRepository.deleteById(idLongInfo);
    }
}
