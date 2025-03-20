package com.example.patientaccounting.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "log_receipt")
@AllArgsConstructor
@NoArgsConstructor
public class LogReceipt {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDate date_receipt;
    private LocalDateTime date_time_alcohol;
    private String string_time_receipt;
    private String number_phone_representative;
    private String delivered;
    private String fact_alcohol;
    private String result_research;
    private String department_medical_organization;
}
