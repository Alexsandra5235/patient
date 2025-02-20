package com.example.patientaccounting.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "mkd10")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Medical {

    @Id
    @Column(name = "code")
    private String id;

    @Column(name = "title")
    private String value;

    @Column(name = "indicator")
    private String indicator;
}
