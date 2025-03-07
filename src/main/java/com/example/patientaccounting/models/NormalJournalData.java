package com.example.patientaccounting.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Data
@Entity
@Table(name = "normal_data")
@AllArgsConstructor
@NoArgsConstructor
public class NormalJournalData {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String str_date_receipt;
    private String str_birth_day;
    private String str_date_time_alcohol;
    private String str_local_date_time_discharge;
    private String str_date_time_inform;




}
