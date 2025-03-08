package com.example.patientaccounting.models;

import com.example.patientaccounting.repository.NormalJournalDataRepository;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

@Entity
@Table(name = "journal")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Journal {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne(cascade = CascadeType.ALL, mappedBy = "journal")
    private JournalInfo journalInfo;
    @OneToOne(cascade = CascadeType.ALL)
    private NormalJournalData normal_data;
    @OneToOne(cascade = CascadeType.REFRESH)
    private Medical medical;
    @OneToOne(cascade = CascadeType.REFRESH)
    private Medical cause_injury;
    @OneToOne(cascade = CascadeType.ALL)
    private Patients patient;

    private LocalDate date_receipt;
    private LocalDateTime date_time_alcohol;
    private LocalDateTime local_date_time_discharge;
    private LocalDateTime date_time_inform;

    private String string_time_receipt;
    private String number_phone_representative;
    private String delivered;
    private String fact_alcohol;
    private String result_research;
    private String department_medical_organization;
    private String outcome_hospitalization;
    private String medical_organization_transferred;
    private String reason_refusal;
    private String full_name_medical_worker;
    private String additional_information;

    @PreUpdate
    protected void onUpdate() {

    }

    @PrePersist
    protected void onCreate() {

    }



}
