package com.example.patientaccounting.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Entity
@Table(name = "mkdcode")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Medical {

    @Id
    private String id;

    @Column(name = "title")
    private String value;
}
