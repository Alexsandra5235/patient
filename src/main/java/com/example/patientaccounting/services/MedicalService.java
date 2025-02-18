package com.example.patientaccounting.services;

import com.example.patientaccounting.repository.MedicalRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import java.util.*;

@Service
@Slf4j
@RequiredArgsConstructor
public class MedicalService {

    private final MedicalRepository medicalRepository;

    public List<String> getMedical(String mkd) {

        return medicalRepository.findAll().stream().
                filter(code -> code.getId().contains(mkd))
                .map(item -> item.getId() + " - " + item.getValue()) // Форматирование строки
                .toList(); // Сбор в список
    }

}
