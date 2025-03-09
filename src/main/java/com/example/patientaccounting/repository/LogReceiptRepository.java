package com.example.patientaccounting.repository;

import com.example.patientaccounting.models.LogReceipt;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LogReceiptRepository extends JpaRepository<LogReceipt, Long> {
}
