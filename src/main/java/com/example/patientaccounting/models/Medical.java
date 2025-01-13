package com.example.patientaccounting.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Entity
@Table(name = "medical")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Medical {

    @Id
    private String id;

    @Column(name = "value")
    private String value;

    @Column(name = "response_code")
    private String response_code;
}
