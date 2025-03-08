package com.example.patientaccounting.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "journal_info")
@AllArgsConstructor
@NoArgsConstructor
public class JournalInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private LocalDateTime date_time_create_record;
    private LocalDateTime date_time_edit_record;
    @OneToOne
    @JoinColumn(name = "journal_id")
    private Journal journal;

    @PrePersist
    private void onCreate(){
        this.date_time_create_record = LocalDateTime.now();
    }

}
