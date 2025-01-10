package com.example.patientaccounting.controllers;

import com.example.patientaccounting.services.AddressService;
import com.example.patientaccounting.services.CountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CountryController {

    private final CountryService countryService;

    @Autowired
    public CountryController(CountryService countryService) {
        this.countryService = countryService;
    }

    @GetMapping("/api/suggest-country")
    public List<String> suggestAddress(@RequestParam(name = "query", required = false) String query) {


        return countryService.getCountrySuggestions(query);
    }
}
