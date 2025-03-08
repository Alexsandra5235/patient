package com.example.patientaccounting.services;

import com.example.patientaccounting.models.NormalJournalData;
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
    private final NormalJournalDataService normalJournalDataService;

    public void savePatient(Patients patient, NormalJournalData normalJournalData) {
        if (patient == null) return;
        setNormalPatientData(patient, normalJournalData);
        patientsRepository.save(patient);
    }

    private void setNormalPatientData(Patients patient, NormalJournalData normalJournalData){
        if (normalJournalData == null) return;
        normalJournalDataService.setNormalJournalData(normalJournalData,patient);
    }

    public void editPatient(Patients patient, Patients beforePatient, NormalJournalData normalJournalData) {
        if (patient == null || beforePatient == null) return;
        if (!patient.getBirth_day().equals(beforePatient.getBirth_day())){
            normalJournalDataService.setNormalJournalData(normalJournalData,patient);
        }
        patientsRepository.save(patient);
    }
}
