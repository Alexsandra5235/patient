package com.example.patientaccounting.services;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static com.example.patientaccounting.Constants.*;

@Service
@Slf4j
public class AddressService {

    private final RestTemplate restTemplate;

    @Autowired
    public AddressService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public List<String> getAddressSuggestions(String addressFragment) {
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", API_KEY);
        headers.set("Content-Type", "application/json");
        headers.set("Accept", "application/json");

        log.info(headers.toString());


        String requestBody = "{\"query\": \"" + addressFragment + "\"}";
        HttpEntity<String> entity = new HttpEntity<>(requestBody, headers);

        log.info(requestBody);

        ResponseEntity<Map<String, Object>> response = restTemplate.exchange(API_URL, HttpMethod.POST, entity, new ParameterizedTypeReference<Map<String, Object>>() {});

        // Получите список подсказок из ответа
        List<Map<String, Object>> suggestions = (List<Map<String, Object>>) response.getBody().get("suggestions");

        // Преобразуйте их в список строк
        return suggestions.stream()
                .map(s -> (String) s.get("value")) // Получаем значение из каждой подсказки
                .collect(Collectors.toList());
    }


}
