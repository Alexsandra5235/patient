package com.example.patientaccounting.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "mkd")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Medical {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @Column(name = "code")
    private String code;

    @Column(name = "value")
    private String value;

    @Column(name = "indicator")
    private String indicator;

    @ManyToMany
    private List<Medical> groupData = new ArrayList<>();
}
