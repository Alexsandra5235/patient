package com.example.patientaccounting.services;

import com.example.patientaccounting.models.Medical;
import com.example.patientaccounting.repository.MedicalRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import java.util.*;

@Service
@Slf4j
@RequiredArgsConstructor
public class MedicalService {

    private final MedicalRepository medicalRepository;

    public List<String> getMedical(String mkd) {

        return medicalRepository.findAll().stream().
                filter(code -> code.getCode().contains(mkd))
                .map(item -> item.getCode() + " - " + item.getValue()) // Форматирование строки
                .toList(); // Сбор в список
    }

    public List<Medical> getMedicals() {
        return medicalRepository.findAll();
    }

    // Метод для проверки, является ли индикатор корректным
    private boolean isIndicatorValid(Medical item) {
        try {
            return Integer.parseInt(item.getIndicator()) <= 21;
        } catch (NumberFormatException e) {
            return false; // Если преобразование не удалось, возвращаем false
        }
    }

    private boolean isParse(Medical item) {
        try {
            Integer.parseInt(item.getIndicator());
            return true;
        } catch (NumberFormatException e) {
            return false; // Если преобразование не удалось, возвращаем false
        }
    }

    public List<Medical> getClassMkd(){
        List<Medical> medicalList = new ArrayList<>(medicalRepository.findAll().stream()
                .filter(this::isIndicatorValid) // Применяем метод isIndicatorValid ко всем элементам
                .toList()); // Собираем результат в список


        medicalList.sort(Comparator.comparing(medical -> Integer.parseInt(medical.getIndicator())));

//        for (Medical medical : medicalList) {
//            List<Medical> currentList = new ArrayList<>();
//            for (int i = 1; i < 40; i++) {
//                for (Medical medical1 : medicalRepository.findAll()) {
//                    if (isParse(medical1)) {
//                        if ((Integer.parseInt(medical.getIndicator()) * 100 + i) == Integer.parseInt(medical1.getIndicator())) {
//                            currentList.add(medical1);
//                        }
//                    }
//                }
//
//            }
//            medical.setGroupData(currentList); // сохранение подклассов (102,103,...)
//            medicalRepository.save(medical);
//            log.info("save medical pod class {}", medical.getIndicator());
//        }

//        for (Medical medical : medicalList){
//            for (Medical medical1 : medical.getGroupData()){
//                List<Medical> currentList = new ArrayList<>();
//                String str = medical1.getIndicator(); // например 201
//                if (str.length() == 3){
//                    str = "0" + str;
//                }
//                for (Medical medical2 : medicalRepository.findAll()) {
//                    if (medical2.getIndicator().contains(str)){
//                        if (medical2.getIndicator().length() == 7) { // например 0201A00
//                            currentList.add(medical2);
//                        }
//                    }
//                }
//                medical1.setGroupData(currentList);
//                medicalRepository.save(medical1);
//                log.info("save medical pod class {}", medical1.getIndicator());
//            }
//
//        }

//        for (Medical medical : medicalList) { // 1
//            for (Medical medical1 : medical.getGroupData()){ // 101
//                for (Medical medical2 : medical1.getGroupData()){ // 0101A00
//                    List<Medical> currentList = new ArrayList<>();
//                    for (Medical medical3 : medicalRepository.findAll()){
//                        if (medical3.getIndicator().contains(medical2.getIndicator())){
//                            if (medical3.getIndicator().length() == 8){
//                                currentList.add(medical3);
//                            }
//                        }
//                    }
//                    medical2.setGroupData(currentList);
//                    medicalRepository.save(medical2);
//                    log.info("save medical pod class {}", medical2.getIndicator());
//                }
//            }
//        }

//            for (Medical medical2 : currentList) {
//                List<Medical> currentList2 = new ArrayList<>();
//                for (Medical medical3 : medicalRepository.findAll()) {
//                    String str = medical2.getIndicator(); // например 201
//                    if (str.length() == 3){
//                        str = "0" + str; // например 0201
//                    }
//                    if (medical3.getIndicator().contains(str)) {
//                        if (medical3.getIndicator().length() == 7) { // например 0201A00
//                            currentList2.add(medical3);
//                        }
//                    }
//                }
//                medical2.setGroupData(currentList2);
//                medicalRepository.save(medical2);
//                log.info("save medical (C00,A00,A01) {}", medical2.getIndicator());
//
//                for (Medical medical4 : currentList2) {
//                    List<Medical> currentList4 = new ArrayList<>();
//                    for (Medical medical5 : medicalRepository.findAll()) {
//                        if (medical5.getIndicator().contains(medical4.getIndicator())){
//                            if (medical5.getIndicator().length() == 8){
//                                currentList4.add(medical5);
//                            }
//                        }
//                    }
//                    medical4.setGroupData(currentList4);
//                    medicalRepository.save(medical4);
//                    log.info("save medical (C00.1,A00.4,A01.1) {}", medical4.getIndicator());
//                }
//
//            }

        return medicalList;

    }

}
