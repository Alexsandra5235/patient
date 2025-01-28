package com.example.patientaccounting.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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

    @Column(name = "date_receipt")
    private LocalDate date_receipt;

    // Для отображения в таблице в формате dd.mm.yyyy
    @Column(name = "normal_date")
    private String normal_date;

    // Для отображения в таблице в формате hh:mm
    @Column(name = "string_time_receipt")
    private String string_time_receipt;

    @Column(name = "full_name")
    private String full_name;

    @Column(name = "birth_day")
    private LocalDate birth_day;

    // Для отображения в таблице в формате dd.mm.yyyy
    @Column(name = "normal_birth_day")
    private String normal_birth_day;

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

    private String medical;

    private String cause_injury;

    private String fact_alcohol;

    private LocalDateTime date_time_alcohol;

    private String result_research;

    private String department_medical_organization;

    private String outcome_hospitalization;

    // Дата и время выписки
    private String date_time_discharge;

    // Дата и время выписки для заполнения input
    private LocalDateTime local_date_time_discharge;

    private String medical_organization_transferred;

    private LocalDateTime date_time_inform;

    private String reason_refusal;

    private String full_name_medical_worker;

    private String additional_information;

    @PreUpdate
    @PrePersist
    protected void onCreate() {

        // Изменение даты поступления по формату
        if (date_receipt != null) {
            normal_date = getNormalData(date_receipt);
        }

        // Изменение даты рождения по формату
        if (birth_day != null){
            normal_birth_day = getNormalData(birth_day);
        }

        // Изменение даты выписки по формату
        if (!date_time_discharge.isEmpty()){
            local_date_time_discharge = LocalDateTime.parse(date_time_discharge);

            String normal_date_discharge = getNormalData(local_date_time_discharge.toLocalDate());

            String timeDischarge = local_date_time_discharge.toLocalTime().toString();
            date_time_discharge = String.format(normal_date_discharge + " " + timeDischarge);
        }

    }

    protected String getNormalData(LocalDate data){
        int yearDischarge = data.getYear();
        int monthDischarge = data.getMonthValue();
        int dayDischarge = data.getDayOfMonth();

        return String.format("%02d.%02d.%04d", dayDischarge, monthDischarge, yearDischarge);
    }

}
