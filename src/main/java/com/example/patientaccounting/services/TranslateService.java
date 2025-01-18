package com.example.patientaccounting.services;

import com.example.patientaccounting.TranslationResponse;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import static com.example.patientaccounting.Constants.*;

@Service
@Slf4j
public class TranslateService {

    private final RestTemplate restTemplate;

    @Autowired
    public TranslateService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public String translate(String text) {

        String replaceText = text.replace(" ", "+");
        log.info(replaceText);
        String url = API_URL_TRANSLATE.concat(replaceText);

        log.info("translate url: " + url);
        TranslationResponse response = restTemplate.getForObject(url, TranslationResponse.class);

        assert response != null;
        return response.getDestinationText();
    }


}
