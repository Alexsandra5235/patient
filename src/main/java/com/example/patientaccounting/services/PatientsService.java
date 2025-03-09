package com.example.patientaccounting.services;

import com.example.patientaccounting.models.NormalData;
import com.example.patientaccounting.models.Patients;
import com.example.patientaccounting.repository.PatientsRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class PatientsService {

    private final PatientsRepository patientsRepository;
    private final NormalDataService normalDataService;

    public void savePatient(Patients patient, NormalData normalData) {
        if (patient == null) return;
        setNormalPatientData(patient, normalData);
        patientsRepository.save(patient);
    }

    private void setNormalPatientData(Patients patient, NormalData normalData){
        if (normalData == null) return;
        normalDataService.setNormalJournalData(normalData,patient);
    }

    public void editPatient(Patients patient, Patients beforePatient, NormalData normalData) {
        if (patient == null) return;
        if (!patient.getBirth_day().equals(beforePatient.getBirth_day())){
            normalDataService.setNormalJournalData(normalData,patient);
        }
        patient.setNormal_data(normalData);
        patientsRepository.save(patient);
    }
}
