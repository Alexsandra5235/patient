package com.example.patientaccounting.models;

import com.example.patientaccounting.repository.LogRepository;
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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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
    @OneToOne(cascade = CascadeType.ALL)
    private LogDischarge log_discharge;
    @OneToOne(cascade = CascadeType.ALL)
    private LogReject log_reject;



    @PreUpdate
    protected void onUpdate() {

    }

    @PrePersist
    protected void onCreate() {

    }
}
