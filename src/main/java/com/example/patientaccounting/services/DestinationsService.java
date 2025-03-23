package com.example.patientaccounting.services;

import com.example.patientaccounting.models.Destination;
import com.example.patientaccounting.models.Patients;
import com.example.patientaccounting.repository.DestinationsRepository;
import com.example.patientaccounting.repository.PatientsRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

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

    public void addDestination(Destination destination, Long patientId) {
        destination.setId(null);
        destinationsRepository.save(destination);
        Patients patient = proceduresService.getPatient(patientId);
        List<Destination> destinationList = patient.getDestinations();
        destinationList.add(destination);
        patient.setDestinations(destinationList);
        patientsRepository.save(patient);

    }

    public List<Destination> getDestinationsByPatientId(Long patientId) {
        Patients patients = proceduresService.getPatient(patientId);
        return patients.getDestinations();
    }

    public void deleteDestination(Long id,Long id_destination){

        Patients patient = patientsService.getPatientByID(id);
        Destination destination = patient.getDestinations().stream()
                .filter(d -> d.getId().equals(id_destination)).findFirst().orElse(null);

        assert destination != null;
        destinationsRepository.delete(destination);
    }
}
