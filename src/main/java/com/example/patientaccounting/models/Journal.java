package com.example.patientaccounting.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Entity
@Table(name = "journal")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Journal {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "date_receipt")
    private LocalDate date_receipt;

    @Column(name = "normal_date")
    private String normal_date;

    @Column(name = "time_receipt")
    private LocalTime time_receipt;

    @Column(name = "full_name")
    private String full_name;

    @Column(name = "birth_day")
    private LocalDate birth_day;

    @Column(name = "normal_birth_day")
    private String normal_birth_day;

    @PrePersist
    protected void onCreate() {
        int year = date_receipt.getYear();
        int month = date_receipt.getMonthValue();
        int day = date_receipt.getDayOfMonth();

        int yearBD = birth_day.getYear();
        int monthBD = birth_day.getMonthValue();
        int dayBD = birth_day.getDayOfMonth();

        normal_date = String.format("%02d.%02d.%04d", day, month, year);
        normal_birth_day = String.format("%02d.%02d.%04d", dayBD, monthBD, yearBD);
    }





}
