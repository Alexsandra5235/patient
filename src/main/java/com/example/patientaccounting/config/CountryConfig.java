package com.example.patientaccounting.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
public class CountryConfig {

    @Bean
    public RestTemplate restTemplateCountry() {
        return new RestTemplate();
    }
}
