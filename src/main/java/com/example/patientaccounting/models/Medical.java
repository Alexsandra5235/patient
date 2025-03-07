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

//    @OneToOne(cascade = CascadeType.REFRESH)
//    private Journal journal_medical;
//    @OneToOne(cascade = CascadeType.REFRESH)
//    private Journal journal_cause_injury;

}
