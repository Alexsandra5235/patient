package com.example.patientaccounting.controllers;

import com.example.patientaccounting.models.Destination;
import com.example.patientaccounting.services.DestinationsService;
import com.example.patientaccounting.services.LogService;
import com.example.patientaccounting.services.ProceduresService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@Slf4j
public class DestinationController {

    private final ProceduresService proceduresService;
    private final LogService logService;
    private final DestinationsService destinationsService;

    @GetMapping("/patient/{id}/programs/add")
    private String addProgram(@PathVariable long id, Model model) {

        model.addAttribute("dateProcedures", proceduresService.getDateProcedureByPatients(id));
        model.addAttribute("procedures", proceduresService.getListProcedures());
        model.addAttribute("patient", proceduresService.getPatient(id));
        model.addAttribute("log",logService.getLogByIdPatients(id));
        return "program";
    }

    @PostMapping("/patient/{id}/add/destination")
    private String addDestination(@PathVariable long id, Model model, Destination destination) {
        destinationsService.addDestination(destination, id);
        return "redirect:/patient/%d/programs/add".formatted(id);

    }
}
