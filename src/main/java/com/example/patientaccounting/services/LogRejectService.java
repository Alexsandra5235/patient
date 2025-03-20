package com.example.patientaccounting.services;

import com.example.patientaccounting.models.LogReject;
import com.example.patientaccounting.repository.LogRejectRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class LogRejectService {

    private final LogRejectRepository logRejectRepository;

    public void saveLogReject(LogReject logReject) {
        if (logReject == null) return;;
        logRejectRepository.save(logReject);
    }
}
