package com.example.patientaccounting.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@Entity
@Table(name = "patients")
@AllArgsConstructor
@NoArgsConstructor
public class Patients {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String full_name;
    private LocalDate birth_day;
    private String gender;
    private String password;
    private String nationality;
    private String address;
    private String registration_place_stay;
    private String snils;
    private String polis;
    private String medical_card;

}
