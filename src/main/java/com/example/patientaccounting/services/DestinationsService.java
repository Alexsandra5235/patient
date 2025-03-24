package com.example.patientaccounting.services;

import com.example.patientaccounting.models.Destination;
import com.example.patientaccounting.models.Patients;
import com.example.patientaccounting.repository.DestinationsRepository;
import com.example.patientaccounting.repository.PatientsRepository;
import jakarta.persistence.EntityNotFoundException;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
@RequiredArgsConstructor
public class DestinationsService {

    private final DestinationsRepository destinationsRepository;
    private final ProceduresService proceduresService;
    private final PatientsRepository patientsRepository;
    private final PatientsService patientsService;

//    public void addDestination(Destination destination, Long patientId) {
////        destination.setId(null);
//        Patients patient = proceduresService.getPatient(patientId);
//        if (patient != null) destination.setPatient(patient);
//        destinationsRepository.save(destination);
//
//    }


    public void addDestination(Destination destination, Long patientId) {
        // Получаем актуальную версию пациента из базы данных
        Patients patient = proceduresService.getPatient(patientId);

        if (patient != null) {
            List<Destination> destinations = patient.getDestinations();

            destinations.add(destination);

            patient.setDestinations(destinations);

            // Привязываем пациента к назначению
            destination.setPatient(patient);

            destination.setId(null);

            // Сохраняем назначение
            destinationsRepository.save(destination);
        } else {
            throw new EntityNotFoundException("Patient not found with ID: " + patientId);
        }
    }

    public List<Destination> getDestinationsByPatientId(Long patientId) {
        Patients patients = proceduresService.getPatient(patientId);
        return patients.getDestinations();
    }

    public void deleteDestination(Long id,Long id_destination){

//        Patients patient = patientsService.getPatientByID(id);
//        Destination destination = patient.getDestinations().stream()
//                .filter(d -> d.getId().equals(id_destination)).findFirst().orElse(null);
//
//        assert destination != null;
        destinationsRepository.deleteById(id_destination);
    }
}
