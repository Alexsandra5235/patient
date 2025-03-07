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
    private String dateAddRecord;
    private LocalDateTime localDateAddRecord;
    private String timeAddRecord;
    private LocalTime localTimeAddRecord;

    @OneToOne(cascade = CascadeType.ALL)
    private NormalJournalData normal_data;

    private LocalDate date_receipt;
    // Для отображения в таблице в формате hh:mm
    private String string_time_receipt;
    private String full_name;
    private LocalDate birth_day;
    private String gender;
    private String password;
    private String nationality;
    private String address;
    private String registration_place_stay;
    private String number_phone_representative;
    private String snils;
    private String polis;
    private String delivered;
    private String medical_card;
    @OneToOne(cascade = CascadeType.REFRESH)
    private Medical medical;
    @OneToOne(cascade = CascadeType.REFRESH)
    private Medical cause_injury;
    private String fact_alcohol;
    private LocalDateTime date_time_alcohol;
    private String result_research;
    private String department_medical_organization;
    private String outcome_hospitalization;
    private LocalDateTime local_date_time_discharge;
    private String medical_organization_transferred;
    private LocalDateTime date_time_inform;
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
