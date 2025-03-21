package com.example.patientaccounting.services;

import com.example.patientaccounting.models.Destination;
import com.example.patientaccounting.models.Patients;
import com.example.patientaccounting.repository.DestinationsRepository;
import com.example.patientaccounting.repository.PatientsRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class DestinationsService {

    private final DestinationsRepository destinationsRepository;
    private final ProceduresService proceduresService;
    private final PatientsRepository patientsRepository;

    public void addDestination(Destination destination, Long patientId) {
        destination.setId(null);
        destinationsRepository.save(destination);
        Patients patient = proceduresService.getPatient(patientId);
        List<Destination> destinationList = patient.getDestinations();
        destinationList.add(destination);
        patient.setDestinations(destinationList);
        patientsRepository.save(patient);

    }
}
