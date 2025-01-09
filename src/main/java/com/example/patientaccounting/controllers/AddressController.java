package com.example.patientaccounting.controllers;

import com.example.patientaccounting.services.AddressService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@Slf4j
public class AddressController {

    private final AddressService addressService;

    @Autowired
    public AddressController(AddressService addressService) {
        this.addressService = addressService;
    }

    @GetMapping("/api/suggest-address")
    public List<String> suggestAddress(@RequestParam(name = "query", required = false) String query) {
        return addressService.getAddressSuggestions(query);
    }
}
