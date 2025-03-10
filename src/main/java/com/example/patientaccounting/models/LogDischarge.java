package com.example.patientaccounting.models;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "log_discharge")
public class LogDischarge {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDateTime local_date_time_discharge;
    private LocalDateTime date_time_inform;
    private String outcome_hospitalization;
    private String medical_organization_transferred;
}
