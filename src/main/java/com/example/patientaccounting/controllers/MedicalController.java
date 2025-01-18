package com.example.patientaccounting.controllers;

import com.example.patientaccounting.services.AddressService;
import com.example.patientaccounting.services.MedicalService;
import com.example.patientaccounting.services.TranslateService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

import static com.example.patientaccounting.Constants.uri;

@RestController
@RequiredArgsConstructor
public class MedicalController {

    private final MedicalService medicalService;
    private final TranslateService translateService;

//    @Autowired
//    public MedicalController(MedicalService medicalService) {
//        this.medicalService = medicalService;
//    }

    @GetMapping("/api/suggest-medical")
    public List<String> suggestAddress(@RequestParam(name = "query", required = false) String query) throws Exception {

        return medicalService.getResponse(query);
    }
}
