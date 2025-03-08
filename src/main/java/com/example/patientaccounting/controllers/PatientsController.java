package com.example.patientaccounting.controllers;

import com.example.patientaccounting.models.Patients;
import com.example.patientaccounting.services.PatientsService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class PatientsController {

    private final PatientsService patientsService;


}
