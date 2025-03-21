package com.example.patientaccounting.repository;

import com.example.patientaccounting.models.Destination;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DestinationsRepository extends JpaRepository<Destination,Long> {
}
