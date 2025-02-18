package com.example.patientaccounting.controllers;

import com.example.patientaccounting.services.ApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static com.example.patientaccounting.Constants.API_URL_COUNTRY;

@RestController
public class CountryController {

    private final ApiService apiService;

    @Autowired
    public CountryController(ApiService apiService) {
        this.apiService = apiService;
    }

    @GetMapping("/api/suggest-country")
    public List<String> suggestAddress(@RequestParam(name = "query", required = false) String query) {
        return apiService.getSuggestions(query,API_URL_COUNTRY);
    }
}
