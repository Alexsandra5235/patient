package com.example.patientaccounting.services;

import com.example.patientaccounting.repository.DestinationsRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class DestinationsService {

    private final DestinationsRepository destinationsRepository;
}
