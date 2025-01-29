package com.example.patientaccounting.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Entity
@Table(name = "report")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Report {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String fileName;

    @Lob // Указывает, что это большой объект
    private byte[] fileContent; // Содержимое файла в виде массива байтов

    private LocalDateTime createdAt;

    private String createdDate;

    private String createdTime;

    @PrePersist
    @PreUpdate
    private void onCreate(){

        if (createdAt != null){
            LocalDate date = createdAt.toLocalDate();
            int day = date.getDayOfMonth();
            int mouth = date.getMonthValue();
            int year = date.getYear();
            createdDate = String.format("%02d.%02d.%04d", day, mouth, year);

            LocalTime time = createdAt.toLocalTime();
            int hour = time.getHour();
            int minute = time.getMinute();
            createdTime = String.format(hour + ":" + minute);
        }

    }

}
