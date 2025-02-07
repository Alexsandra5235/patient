package com.example.patientaccounting.services;

import com.example.patientaccounting.models.Journal;
import com.example.patientaccounting.models.Report;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;


import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import static com.example.patientaccounting.Constants.*;

@Service
@Slf4j
@RequiredArgsConstructor
public class JournalExportExcel {

    private final ReportService reportService;

    Row rowCurrent;
    Cell cellCurrent;

    private void setDefaultSettings(Workbook workbook,Sheet sheet, int firstRow, int endRow, int firstCol, int endCol, String nameCol,
                                    HorizontalAlignment alignment, Boolean border, int rotation,
                                    boolean underline, int fontHeight, boolean bold, boolean borderButton,
                                    boolean wrapText, boolean background){

        CellStyle style = workbook.createCellStyle();

        // Создаем стиль для белой заливки
        CellStyle whiteFillStyle = workbook.createCellStyle();


        Font font = workbook.createFont();

        // Устанавливаем выравнивание текста
        style.setAlignment(alignment);
        style.setVerticalAlignment(VerticalAlignment.CENTER);
        style.setRotation((short) rotation);

        style.setWrapText(wrapText); // Включаем перенос текста



        // Устанавливаем шрифт
        font.setFontName("Times New Roman"); // Название шрифта
        font.setFontHeightInPoints((short) fontHeight); // Размер шрифта
        font.setBold(bold);

        if (underline) {
            font.setUnderline(FontUnderline.SINGLE.getByteValue()); // Устанавливаем нижнее подчеркивание
        } else {
            font.setUnderline(FontUnderline.NONE.getByteValue()); // Убираем подчеркивание
        }

        style.setFont(font); // Применяем шрифт к стилю

        // Устанавливаем границы
        if (border) {
            style.setBorderBottom(BorderStyle.THIN);
            style.setBorderTop(BorderStyle.THIN);
            style.setBorderLeft(BorderStyle.THIN);
            style.setBorderRight(BorderStyle.THIN);
        } else if (borderButton) {
            style.setBorderBottom(BorderStyle.THIN);
        } else {
            style.setBorderBottom(BorderStyle.NONE);
            style.setBorderTop(BorderStyle.NONE);
            style.setBorderLeft(BorderStyle.NONE);
            style.setBorderRight(BorderStyle.NONE);
        }

//        if (background) {
//            style.setFillForegroundColor(IndexedColors.WHITE.getIndex());
//            style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
//        }

        // Объединяем ячейки
        if ((firstRow != endRow) || (firstCol != endCol)) {
            sheet.addMergedRegion(new CellRangeAddress(firstRow, endRow, firstCol, endCol));
        }


        rowCurrent = sheet.getRow(firstRow);
        if (rowCurrent == null) {
            rowCurrent = sheet.createRow(firstRow);
        }

        cellCurrent = rowCurrent.getCell(firstCol);
        if (cellCurrent == null) {
            cellCurrent = rowCurrent.createCell(firstCol);
        }

        if (nameCol != null) cellCurrent.setCellValue(nameCol); // Установка значения

        for (int rowIndex = firstRow; rowIndex <= endRow; rowIndex++) {
            Row row = sheet.getRow(rowIndex);
            if (row == null) {
                row = sheet.createRow(rowIndex);
            }
            for (int colIndex = firstCol; colIndex <= endCol; colIndex++) {
                Cell cell = row.getCell(colIndex);
                if (cell == null) {
                    cell = row.createCell(colIndex);
                }
                cell.setCellStyle(style); // Применяем стиль границы

            }
        }

    }

    public void createHeadLeft(Workbook workbook,Sheet sheet){



        for(int i = 0; i < 5; i++){

            if (i == 4) setDefaultSettings(workbook,sheet,i,i,0,4,headsLeft.get(i),
                    HorizontalAlignment.CENTER, false,0, true, fontHeightHead,
                    false, false, true, false);

            else setDefaultSettings(workbook,sheet,i,i,0,4,headsLeft.get(i),HorizontalAlignment.LEFT,
                    false,0, false, fontHeightHead, false, false,
                    true, true);
        }

    }

    public void createHeadRight(Workbook workbook,Sheet sheet){


        for (int i = 2; i < 6; i++){
            setDefaultSettings(workbook,sheet,i,i,19,24, headsRight.get(i-2),HorizontalAlignment.CENTER,
                    false,0, false, fontHeightHead, false, false,
                    true, true);
        }

        setDefaultSettings(workbook,sheet,0,0,19,21,order,HorizontalAlignment.RIGHT,
                false,0, false, fontHeightHead, false, false,
                true, false);
        setDefaultSettings(workbook,sheet,0,0,22,24,null, HorizontalAlignment.CENTER,
                false,0, false, fontHeightHead, false, true,
                true, false);

    }

    public void createTitle(Workbook workbook, Sheet sheet,String date1, String date2){

        String title3 = "за период с " + date1 + " 08:00 по " + date2 + " 07:59";

        List<String> titles = List.of(title1, title2, title3, title4);


        for (int i = 8; i < 12; i++){
            if (i == 11) setDefaultSettings(workbook,sheet,i,i,0,24, titles.get(i-8), HorizontalAlignment.CENTER,
                    false,0,false, fontHeightHead,false, false,
                    true, false);
            else setDefaultSettings(workbook,sheet,i,i,0,24, titles.get(i-8), HorizontalAlignment.CENTER,
                    false,0,false, fontHeightTitle,true, false,
                    true, false);
        }
    }

    public void createNumsRow(Workbook workbook, Sheet sheet){

        for (int i = 0; i < 10; i++){
            setDefaultSettings(workbook,sheet,18,18,i,i, String.valueOf(i+1),HorizontalAlignment.CENTER,
                    true,0,false,fontHeightHead,false,false,
                    true, false);
        }

        for (int i = 13; i < 25; i++){
            setDefaultSettings(workbook,sheet,18,18,i,i, String.valueOf(i-1),HorizontalAlignment.CENTER,
                    true,0,false,fontHeightHead,false,false,
                    true, false);
        }

        setDefaultSettings(workbook,sheet,18,18,10,10, "10A",HorizontalAlignment.CENTER,
                true,0,false,fontHeightHead,false,false,
                true, false);

        setDefaultSettings(workbook,sheet,18,18,11,11, "11",HorizontalAlignment.CENTER,
                true,0,false,fontHeightHead,false,false,
                true, false);

        setDefaultSettings(workbook,sheet,18,18,12,12, "11A",HorizontalAlignment.CENTER,
                true,0,false,fontHeightHead,false,false,
                true, false);
    }

    public void setSizeColumn(Sheet sheet){

        // Устанавливаем ширину столбца для лучшего отображения
        sheet.setColumnWidth(0, 9000); // Измените значение по необходимости

        //Row rowI;

        for (int i = 14; i < 18; i++){
            // Устанавливаем высоту 18-й строки
            rowCurrent = sheet.getRow(i); // Индекс 17 соответствует 18-й строке
            if (rowCurrent == null) {
                rowCurrent = sheet.createRow(i);
            }

            if (i != 17) rowCurrent.setHeightInPoints(32);
            else rowCurrent.setHeightInPoints(200);


        }
    }

    public void createColumnReport(Workbook workbook,Sheet sheet){

        setDefaultSettings(workbook,sheet,19,19,0,0,nameRowTotal,HorizontalAlignment.RIGHT,
                true,0,false,fontHeightHead,true,false,
                true, false);

        setDefaultSettings(workbook,sheet,20,20,0,0,nameRowDayHospital,HorizontalAlignment.LEFT,
                true,0,false,fontHeightTableReport,true,false,
                true, false);

        for (int i = 21; i < 23; i++){
            setDefaultSettings(workbook,sheet,i,i,0,0, nameRowsReport.get(i-21), HorizontalAlignment.RIGHT,
                    true,0,false,fontHeightHead,false,false,
                    false, false);
        }

        setDefaultSettings(workbook,sheet,25,25,16,18,endRow,HorizontalAlignment.RIGHT,
                false,0,false,fontHeightHead,false,false,
                true, true);

        setDefaultSettings(workbook,sheet,25,25,19,21,null,HorizontalAlignment.CENTER,
                false,0,false,fontHeightHead,false,true,
                false, true);
    }

    public void createColumnVertical(Workbook workbook, Sheet sheet){


        for (int i = 1; i < 25; i++){
            int firstRow = cellsFirst.get(i-1);
            String nameCol = nameColumnsVerticals.get(i-1);

            setDefaultSettings(workbook,sheet,firstRow,17, i, i, nameCol,HorizontalAlignment.CENTER,
                    true, 90, false, fontHeightHead, false, false,
                    true, false);

        }


    }

    public void createBorder(Workbook workbook, Sheet sheet){

        for (int row = 19; row < 23; row++){
            Row rowCurrent = sheet.getRow(row);
            if (rowCurrent == null) rowCurrent = sheet.createRow(row);
            for (int col = 1; col < 25; col++){
                Cell cell = rowCurrent.getCell(col);
                if (cell == null) cell = rowCurrent.createCell(col);
                setDefaultSettings(workbook,sheet,row,row,col,col,null,HorizontalAlignment.CENTER,
                        true,0,false,fontHeightHead,false,false,
                        true, false);
            }
        }
    }

    public void createColumnHorizontal(Workbook workbook, Sheet sheet){


        for (int i = 0; i < 12; i++){
            int firstRow = RowFirst.get(i);
            int rowEnd = RowEnd.get(i);
            int colFirst = ColFirst.get(i);
            int colEnd = ColEnd.get(i);

            String nameCol = nameColumnsHorizontal.get(i);

            setDefaultSettings(workbook,sheet,firstRow,rowEnd, colFirst, colEnd, nameCol,HorizontalAlignment.CENTER,
                    true, 0, false, fontHeightHead, false, false,
                    true, false);

        }


    }

    public void setReportData(Workbook workbook,Sheet sheet,List<Journal> journals){

        setDefaultSettings(workbook,sheet,19,19,3,3,String.valueOf(journals.size()),
                HorizontalAlignment.CENTER,true,0,false,fontHeightHead,
                true,false,true,false);

        setDefaultSettings(workbook,sheet,19,19,20,20,String.valueOf(journals.size()),
                HorizontalAlignment.CENTER,true,0,false,fontHeightHead,
                true,false,true,false);

        setDefaultSettings(workbook,sheet,20,20,3,3,String.valueOf(journals.size()),
                HorizontalAlignment.CENTER,true,0,false,fontHeightTableReport,
                true,false,true,false);

        setDefaultSettings(workbook,sheet,20,20,20,20,String.valueOf(journals.size()),
                HorizontalAlignment.CENTER,true,0,false,fontHeightTableReport,
                true,false,true,false);

        setDefaultSettings(workbook,sheet,22,22,3,3,String.valueOf(journals.size()),
                HorizontalAlignment.CENTER,true,0,false,fontHeightHead,
                false,false,true,false);

        setDefaultSettings(workbook,sheet,22,22,20,20,String.valueOf(journals.size()),
                HorizontalAlignment.CENTER,true,0,false,fontHeightHead,
                false,false,true,false);
    }

    public void createColumnsSheetPatient(Workbook workbook, Sheet sheet){

        for (int i = 0; i < rowFirstSheetPatient.size(); i++){
            int firstRow = rowFirstSheetPatient.get(i);
            int rowEnd = rowEndSheetPatient.get(i);
            int colFirst = colFirstSheetPatient.get(i);
            int colEnd = colEndSheetPatient.get(i);


            if (i < 6) {
                int colEndNum = colEndSheetPatientNums.get(i);
                int colStartNum = colFirstSheetPatientNums.get(i);

                setDefaultSettings(workbook,sheet,6,6,colStartNum,colEndNum,
                        String.valueOf(i+1),HorizontalAlignment.CENTER,true,0,
                        false,fontHeightHead,false,false,true,false);
            }


            setDefaultSettings(workbook,sheet,firstRow,rowEnd,colFirst,colEnd,
                    nameColumnsSheetPatient.get(i),HorizontalAlignment.CENTER,true,0,
                    false,fontHeightHead,false,false,true,false);

        }

        setDefaultSettings(workbook,sheet,7,7,0,18,
                nameRowDayHospital,HorizontalAlignment.CENTER,true,0,
                false,fontHeightTableReport,true,false,true,false);


    }

    public void setReportDataSheetTwo(Workbook workbook,Sheet sheet,List<Journal> journals){

        for (int i = 0; i < journals.size(); i++){

            setDefaultSettings(workbook,sheet,i+8,i+8,0,2,
                    String.join(" ",journals.get(i).getFull_name(), "\n№",
                            journals.get(i).getId().toString()), HorizontalAlignment.LEFT,true,
                    0,false, fontHeightHead,false,false,true,
                    false);

            // Устанавливаем высоту 18-й строки
            rowCurrent = sheet.getRow(i+8); // Индекс 17 соответствует 18-й строке
            if (rowCurrent == null) {
                rowCurrent = sheet.createRow(i+8);
            }

            rowCurrent.setHeightInPoints(45);

            for (int j = 1; j < colFirstSheetPatientNums.size(); j++) {

                int colEndNum = colEndSheetPatientNums.get(j);
                int colStartNum = colFirstSheetPatientNums.get(j);

                setDefaultSettings(workbook, sheet, i+8, i+8, colStartNum, colEndNum,
                        null, HorizontalAlignment.CENTER, true, 0,
                        false, fontHeightHead, false, false, true, false);

            }
        }


    }

    public ResponseEntity<byte[]> exportToExcel(List<Journal> journals, String date1, String date2) throws IOException {

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Результат");
        Sheet sheetPatient = workbook.createSheet("стр.2");

        setSizeColumn(sheet);

        createHeadRight(workbook,sheet);
        createHeadLeft(workbook,sheet);
        createTitle(workbook,sheet,date1,date2);

        createColumnVertical(workbook,sheet);
        createColumnHorizontal(workbook,sheet);

        createNumsRow(workbook,sheet);
        createColumnReport(workbook,sheet);

        createBorder(workbook,sheet);

        setReportData(workbook,sheet,journals);

        createColumnsSheetPatient(workbook,sheetPatient);

        setReportDataSheetTwo(workbook,sheetPatient,journals);

        // Запись в поток
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        workbook.write(outputStream);
        workbook.close();

        byte[] bytes = outputStream.toByteArray();

        // Сохранение в базе данных
        Report report = new Report();
        report.setFileName("data.xlsx");
        report.setFileContent(bytes);
        report.setCreatedAt(LocalDateTime.now());

        reportService.saveReportByBD(report);

        HttpHeaders headers = new HttpHeaders();

        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=data.xlsx");
        headers.add(HttpHeaders.CONTENT_TYPE, "application/vnd.ms-excel");

        return ResponseEntity.ok()
                .headers(headers)
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(bytes);
    }
}
