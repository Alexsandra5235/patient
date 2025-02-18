package com.example.patientaccounting.services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static com.example.patientaccounting.Constants.*;

@Service
@Slf4j
public class ApiService {

    private final RestTemplate restTemplate;

    @Autowired
    public ApiService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public List<String> getSuggestions(String addressFragment,String apiUrl) {

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", API_KEY);
        headers.set("Content-Type", "application/json");
        headers.set("Accept", "application/json");

        String requestBody = "{\"query\": \"" + addressFragment + "\"}";
        HttpEntity<String> entity = new HttpEntity<>(requestBody, headers);

        // API_URL
        ResponseEntity<Map<String, Object>> response = restTemplate.exchange(apiUrl, HttpMethod.POST, entity, new ParameterizedTypeReference<>() {});

        // Получите список подсказок из ответа
        List<Map<String, Object>> suggestions = (List<Map<String, Object>>) response.getBody().get("suggestions");

        // Преобразуйте их в список строк
        return suggestions.stream()
                .map(s -> (String) s.get("value")) // Получаем значение из каждой подсказки
                .collect(Collectors.toList());
    }


}

