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

    @Column(name = "normal_date")
    private String normal_date;
    @Column(name = "normal_birth_day")
    private String normal_birth_day;
    // Дата и время выписки
    private String date_time_discharge;

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

        // Изменение даты добавления записи по формату
        if (date_receipt != null) {
            normal_date = getNormalData(date_receipt);
        }

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
        if (localDateAddRecord != null){
            dateAddRecord = getNormalData(localDateAddRecord.toLocalDate());
        }
        if (localTimeAddRecord != null){
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");

            timeAddRecord = localTimeAddRecord.format(formatter);
        }
    }

    @PrePersist
    protected void onCreate() {

        localDateAddRecord = LocalDateTime.now();
        localTimeAddRecord = LocalTime.now();


        onUpdate();
    }

    protected String getNormalData(LocalDate data){
        if (data == null) return null;

        int yearDischarge = data.getYear();
        int monthDischarge = data.getMonthValue();
        int dayDischarge = data.getDayOfMonth();

        return String.format("%02d.%02d.%04d", dayDischarge, monthDischarge, yearDischarge);
    }

    protected String getNormalDataTime(LocalDateTime data){
        if (data == null) return null;

        int yearDischarge = data.getYear();
        int monthDischarge = data.getMonthValue();
        int dayDischarge = data.getDayOfMonth();

        int hour = data.getHour();
        int minute = data.getMinute();

        return String.format("%02d.%02d.%04d %02d:%02d", dayDischarge, monthDischarge, yearDischarge, hour, minute);
    }

}
