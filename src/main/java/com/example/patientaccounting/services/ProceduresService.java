package com.example.patientaccounting.services;

import com.example.patientaccounting.models.Log;
import com.example.patientaccounting.models.Patients;
import com.example.patientaccounting.models.Procedures;
import com.example.patientaccounting.repository.LogRepository;
import com.example.patientaccounting.repository.PatientsRepository;
import com.example.patientaccounting.repository.ProceduresRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProceduresService {

    private final ProceduresRepository proceduresRepository;
    private final NormalDataService normalDataService;
    private final LogService logService;
    private final PatientsService patientsService;

    public List<Procedures> getListProcedures(){
        return proceduresRepository.findAll();
    }

    public List<String> getDateProcedureByPatients(Long patientId){
        Log log = logService.getLogByIdPatients(patientId);
        if (log == null) return null;
        List<String> dateProcedures = new ArrayList<>();
        dateProcedures.add(normalDataService.getNormalData(log.getLog_receipt().getDate_receipt()));

        for (int i = 1; i < 14; i++){
            dateProcedures.add(normalDataService.getNormalData(log.getLog_receipt().getDate_receipt().plusDays(i)));
        }
        return dateProcedures;
    }

    public Patients getPatient(Long idPatient){
        return patientsService.getPatientByID(idPatient);
    }

    public void addDestination(){

    }
}
