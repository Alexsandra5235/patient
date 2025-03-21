package com.example.patientaccounting.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Table(name = "procedures")
@AllArgsConstructor
@NoArgsConstructor
public class Procedures {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String procedureName;
}
