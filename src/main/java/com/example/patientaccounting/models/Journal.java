package com.example.patientaccounting.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDate;
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

    @Column(name = "date_receipt")
    private LocalDate date_receipt;

    @Column(name = "normal_date")
    private String normal_date;

    @Column(name = "time_receipt")
    private LocalTime time_receipt;

    @Column(name = "string_time_receipt")
    private String string_time_receipt;

    @Column(name = "full_name")
    private String full_name;

    @Column(name = "birth_day")
    private LocalDate birth_day;

    @Column(name = "normal_birth_day")
    private String normal_birth_day;

    private int hour;

    private int minute;

    private String gender;

    private String password;

    private String nationality;

    private String place_residence;

    private String registration_place_stay;

    private String number_phone_representative;

    private String snils;

    private String polis;

    private String delivered;

    private String medical_card;

    private String diagnosis_disease;

    private String cause_injury;

    private String fact_alcohol;

    private String department_medical_organization;

    private String outcome_hospitalization;

    private String date_time_discharge;

    private String reason_refusal;

    private String full_name_medical_worker;

    private String additional_information;

//    public @Pattern(regexp = "^([01]\\d|2[0-3]):[0-5]\\d$", message = "Время должно быть в формате HH:mm") LocalTime getTime_receipt() {
//        return time_receipt;
//    }

    @PrePersist
    protected void onCreate() {
        int year = date_receipt.getYear();
        int month = date_receipt.getMonthValue();
        int day = date_receipt.getDayOfMonth();

        int yearBD = birth_day.getYear();
        int monthBD = birth_day.getMonthValue();
        int dayBD = birth_day.getDayOfMonth();

        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("HH:mm");

        time_receipt = LocalTime.parse(string_time_receipt, fmt);

        normal_date = String.format("%02d.%02d.%04d", day, month, year);
        normal_birth_day = String.format("%02d.%02d.%04d", dayBD, monthBD, yearBD);

        hour = time_receipt.getHour();
        minute = time_receipt.getMinute();
    }





}
