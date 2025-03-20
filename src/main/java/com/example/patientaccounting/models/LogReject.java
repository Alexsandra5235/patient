package com.example.patientaccounting.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "log_reject")
@AllArgsConstructor
@NoArgsConstructor
public class LogReject {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String reason_refusal;
    private String full_name_medical_worker;
    private String additional_information;
}
