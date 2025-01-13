package com.example.patientaccounting.services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.net.ssl.HttpsURLConnection;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.*;

import static com.example.patientaccounting.Constants.*;

@Service
@Slf4j
public class MedicalService {

    // get the OAUTH2 token
    public String getToken() throws Exception {

        log.info("Getting token...");

        URL url = new URL(TOKEN_ENPOINT);
        HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
        con.setRequestMethod("POST");

        // set parameters to post
        String urlParameters =
                "client_id=" + URLEncoder.encode(CLIENT_ID, StandardCharsets.UTF_8) +
                        "&client_secret=" + URLEncoder.encode(CLIENT_SECRET, StandardCharsets.UTF_8) +
                        "&scope=" + URLEncoder.encode(SCOPE, StandardCharsets.UTF_8) +
                        "&grant_type=" + URLEncoder.encode(GRANT_TYPE, StandardCharsets.UTF_8);
        con.setDoOutput(true);
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        wr.writeBytes(urlParameters);
        wr.flush();
        wr.close();

        // response
        int responseCode = con.getResponseCode();
        log.info("Token Response Code : {}\n", responseCode);

        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuilder response = new StringBuilder();
        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();

        // parse JSON response
        JSONObject jsonObj = new JSONObject(response.toString());
        return jsonObj.getString("access_token");
    }


    // access ICD API
    public String getURI(String token, String uri, String query) throws Exception {

        String value = null;
        log.info("Getting URI...");

        URL url = new URL(uri);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");

        // Разрешаем отправку тела запроса
        //con.setDoOutput(true);

        // HTTP header fields to set
        con.setRequestProperty("Authorization", "Bearer "+token);
        con.setRequestProperty("Accept", "application/json");
        con.setRequestProperty("Accept-Language", "en");
        con.setRequestProperty("API-Version", "v2");


        // response
        int responseCode = con.getResponseCode();
        log.info("URI Response Code : {}\n", responseCode);

        if (responseCode == 200) {
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;

            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            String stringResponse = response.toString();

            // Парсинг строки JSON
            JSONObject jsonObject = new JSONObject(stringResponse);

            // Получение объекта title
            JSONObject titleObject = jsonObject.getJSONObject("title");

            log.info("title: {}", titleObject);


            // Извлечение значения @value
            String titleValue = titleObject.getString("@value");

            // Вывод результата
            log.info("value for text {}: {}",query, titleValue);


            value = String.format(query + " - " + titleValue);


            log.info(value);

            log.info("Response: {}\n", response);

        }


        return value;
    }

//    public String test(String medicalFragment) throws Exception {
//
//        String responseUrl = fullUri + "/" + medicalFragment;
//        log.info("Request Path: {}", responseUrl);
//
//        String token = getToken();
//        return getURI(token, responseUrl, medicalFragment);
//    }

    public List<String> getResponse(String medicalFragment) throws Exception {

        String responseUrl = fullUri + "/" + medicalFragment;
        String currentUrl = null;
        String currentValue = null;

        String token = getToken();

        List<String> responses = new ArrayList<>();

        for (int i = 0; i < 10; i++) {
            switch (medicalFragment.length()){

                case 2,4:
                    currentUrl = fullUri + "/" + medicalFragment + i;
                    log.info("Current url: {}", currentUrl);
                    currentValue = getURI(token, currentUrl, medicalFragment + i);
                    if (currentValue != null){
                        responses.add(currentValue);
                    }
                    break;
                case 3:

                    currentUrl = fullUri + "/" + medicalFragment + "." + i;
                    log.info("Current url: {}", currentUrl);
                    currentValue = getURI(token, currentUrl, medicalFragment + "." + i);
                    if (currentValue != null){
                        responses.add(currentValue);
                    }
                    break;
                case 5:

                    currentUrl = fullUri + "/" + medicalFragment;
                    log.info("Current url: {}", currentUrl);
                    currentValue = getURI(token, currentUrl, medicalFragment);
                    if (currentValue != null){
                        if(!responses.isEmpty()){
                            if (!responses.get(responses.size() - 1).contains(medicalFragment)){
                                responses.add(currentValue);
                            }

                        }
                        else {
                            responses.add(currentValue);
                        }

                    }
                    break;
            }

        }


        return responses;
    }


}
