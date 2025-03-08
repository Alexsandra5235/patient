package com.example.patientaccounting.repository;

import com.example.patientaccounting.models.Journal;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.stream.Collectors;

public interface JournalRepository extends JpaRepository<Journal, Long> {
    default List<Journal> findByFullName(String fullName) {
        return this.findAll().stream().filter(journal ->
                journal.getPatient().getFull_name().toLowerCase().contains(fullName.toLowerCase())).collect(Collectors.toList());
    }
}
