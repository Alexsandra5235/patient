package com.example.patientaccounting.controllers;

import com.example.patientaccounting.services.AddressService;
import com.example.patientaccounting.services.MedicalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static com.example.patientaccounting.Constants.uri;

@RestController
public class MedicalController {

    private final MedicalService medicalService;

    @Autowired
    public MedicalController(MedicalService medicalService) {
        this.medicalService = medicalService;
    }

    @GetMapping("/api/suggest-medical")
    public String suggestAddress(@RequestParam(name = "medicalFragment", required = false) String query) throws Exception {

        return medicalService.test(query);
    }
}
