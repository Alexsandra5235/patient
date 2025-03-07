package com.example.patientaccounting.models;

import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "mkd")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
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

    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "medical")
    private List<Journal> journal_medical;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "cause_injury")
    private List<Journal> journal_cause_injury;

}
