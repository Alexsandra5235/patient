package com.example.patientaccounting.controllers;

import com.example.patientaccounting.models.Medical;
import com.example.patientaccounting.services.MedicalService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;


@RestController
@RequiredArgsConstructor
public class MedicalController {

    private final MedicalService medicalService;


    @GetMapping("/api/suggest-medical")
    public List<String> suggestAddress(@RequestParam(name = "query", required = false) String query) throws Exception {

        return medicalService.getMedicalsByFragment(query);
    }



}
