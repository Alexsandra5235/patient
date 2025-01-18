package com.example.patientaccounting;

import com.fasterxml.jackson.annotation.JsonProperty;

public class TranslationResponse {

    @JsonProperty("destination-text")
    private String destinationText;

    // Геттер
    public String getDestinationText() {
        return destinationText;
    }
}
