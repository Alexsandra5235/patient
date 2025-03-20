package com.example.patientaccounting.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "log_info")
@AllArgsConstructor
@NoArgsConstructor
public class LogInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDateTime date_time_create_record;
    private LocalDateTime date_time_edit_record;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "log_id")
    private Log log;

    @PrePersist
    private void onCreate(){
        this.date_time_create_record = LocalDateTime.now();
    }

}
