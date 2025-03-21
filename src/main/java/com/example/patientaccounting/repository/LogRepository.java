package com.example.patientaccounting.repository;

import com.example.patientaccounting.models.Log;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.stream.Collectors;

public interface LogRepository extends JpaRepository<Log, Long> {
    default List<Log> findByFullName(String fullName) {
        return this.findAll().stream().filter(log ->
                log.getPatient().getFull_name().toLowerCase().contains(fullName.toLowerCase())).collect(Collectors.toList());
    }

    default Log findByIdPatient(Long idPatient) {
        return this.findAll().stream().filter(log ->
                log.getPatient().getId().equals(idPatient)).findFirst().orElse(null);
    }
}
