package com.example.patientaccounting.controllers;

import com.example.patientaccounting.repository.ProceduresRepository;
import com.example.patientaccounting.services.LogService;
import com.example.patientaccounting.services.ProceduresService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
@RequiredArgsConstructor
public class ProceduresController {

    private final ProceduresService proceduresService;
    private final LogService logService;

    @GetMapping("/patient/{id}/programs/add")
    private String addProgram(@PathVariable long id, Model model) {

        model.addAttribute("dateProcedures", proceduresService.getDateProcedureByPatients(id));
        model.addAttribute("procedures", proceduresService.getListProcedures());
        model.addAttribute("patient", proceduresService.getPatient(id));
        model.addAttribute("log",logService.getLogByIdPatients(id));
        return "program";
    }
}
