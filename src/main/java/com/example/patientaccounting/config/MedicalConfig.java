package com.example.patientaccounting.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
public class MedicalConfig {

    @Bean
    public RestTemplate restTemplateMedical() {
        return new RestTemplate();
    }
}
