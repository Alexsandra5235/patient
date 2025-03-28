package com.example.patientaccounting.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.List;

@Entity
@Data
@Table(name = "destinations")
@AllArgsConstructor
@NoArgsConstructor
public class Destination {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    private Procedures procedure;

    @ManyToOne
    @JoinColumn(name = "patient_id", nullable = false)
    private Patients patient;

    private String date_procedure;
    private String time_procedure;
}
