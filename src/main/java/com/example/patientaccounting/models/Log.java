package com.example.patientaccounting.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "log")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Log {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne(cascade = CascadeType.ALL)
    private NormalData normal_data;

    @OneToOne(cascade = CascadeType.REFRESH)
    private Medical medical;
    @OneToOne(cascade = CascadeType.REFRESH)
    private Medical cause_injury;
    @OneToOne(cascade = CascadeType.ALL)
    private Patients patient;
    @OneToOne(cascade = CascadeType.ALL)
    private LogReceipt log_receipt;

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
