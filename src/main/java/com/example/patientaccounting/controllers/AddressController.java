package com.example.patientaccounting.controllers;

import com.example.patientaccounting.services.ApiService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static com.example.patientaccounting.Constants.API_KEY;
import static com.example.patientaccounting.Constants.API_URL;

@RestController
@Slf4j
public class AddressController {

    private final ApiService apiService;

    @Autowired
    public AddressController(ApiService apiService) {
        this.apiService = apiService;
    }

    @GetMapping("/api/suggest-address")
    public List<String> suggestAddress(@RequestParam(name = "query", required = false) String query) {

        return apiService.getSuggestions(query,API_URL);
    }


}
