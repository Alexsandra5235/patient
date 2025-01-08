package com.example.patientaccounting;

import com.example.patientaccounting.models.Journal;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;


import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;

import static com.example.patientaccounting.Constants.*;

public class JournalExportExcel {

    Workbook workbook = new XSSFWorkbook();
    Sheet sheet = workbook.createSheet("Результат");

    Row rowCurrent;
    Cell cellCurrent;

    private void setDefaultSettings(int firstRow, int endRow, int firstCol, int endCol, String nameCol,
                                    HorizontalAlignment alignment, Boolean border, int rotation,
                                    boolean underline, int fontHeight, boolean bold, boolean borderButton,
                                    boolean wrapText){

        CellStyle style = workbook.createCellStyle();
        CellStyle styleBackgroundWhite = workbook.createCellStyle();

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

    public void createHeadLeft(){

        for(int i = 0; i < 5; i++){

            if (i == 4) setDefaultSettings(i,i,0,4,headsLeft.get(i),
                    HorizontalAlignment.CENTER, false,0, true, fontHeightHead,
                    false, false, true);

            else setDefaultSettings(i,i,0,4,headsLeft.get(i),HorizontalAlignment.LEFT,
                    false,0, false, fontHeightHead, false, false,
                    true);
        }

    }

    public void createHeadRight(){

        for (int i = 2; i < 6; i++){
            setDefaultSettings(i,i,19,24, headsRight.get(i-2),HorizontalAlignment.CENTER,
                    false,0, false, fontHeightHead, false, false,
                    true);
        }

        setDefaultSettings(0,0,19,21,order,HorizontalAlignment.RIGHT,
                false,0, false, fontHeightHead, false, false,
                true);
        setDefaultSettings(0,0,22,24,null, HorizontalAlignment.CENTER,
                false,0, false, fontHeightHead, false, true,
                true);

    }

    public void createTitle(String date1, String date2){

        String title3 = "за период с " + date1 + " 08:00 по " + date2 + " 07:59";

        List<String> titles = List.of(title1, title2, title3, title4);


        for (int i = 8; i < 12; i++){
            if (i == 11) setDefaultSettings(i,i,0,24, titles.get(i-8), HorizontalAlignment.CENTER,
                    false,0,false, fontHeightHead,false, false,
                    true);
            else setDefaultSettings(i,i,0,24, titles.get(i-8), HorizontalAlignment.CENTER,
                    false,0,false, fontHeightTitle,true, false,
                    true);
        }
    }

    public void createNumsRow(){

        for (int i = 0; i < 10; i++){
            setDefaultSettings(18,18,i,i, String.valueOf(i+1),HorizontalAlignment.CENTER,
                    true,0,false,fontHeightHead,false,false,
                    true);
        }

        for (int i = 13; i < 25; i++){
            setDefaultSettings(18,18,i,i, String.valueOf(i-1),HorizontalAlignment.CENTER,
                    true,0,false,fontHeightHead,false,false,
                    true);
        }

        setDefaultSettings(18,18,10,10, "10A",HorizontalAlignment.CENTER,
                true,0,false,fontHeightHead,false,false,
                true);

        setDefaultSettings(18,18,11,11, "11",HorizontalAlignment.CENTER,
                true,0,false,fontHeightHead,false,false,
                true);

        setDefaultSettings(18,18,12,12, "11A",HorizontalAlignment.CENTER,
                true,0,false,fontHeightHead,false,false,
                true);
    }

    public void setSizeColumn(){

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

    public void createColumnReport(){

        setDefaultSettings(19,19,0,0,nameRowTotal,HorizontalAlignment.RIGHT,
                true,0,false,fontHeightHead,true,false,
                true);

        setDefaultSettings(20,20,0,0,nameRowDayHospital,HorizontalAlignment.LEFT,
                true,0,false,fontHeightTableReport,true,false,
                true);

        for (int i = 21; i < 23; i++){
            setDefaultSettings(i,i,0,0, nameRowsReport.get(i-21), HorizontalAlignment.RIGHT,
                    true,0,false,fontHeightHead,false,false,
                    false);
        }

        setDefaultSettings(25,25,16,18,endRow,HorizontalAlignment.RIGHT,
                false,0,false,fontHeightHead,false,false,
                true);

        setDefaultSettings(25,25,19,21,null,HorizontalAlignment.CENTER,
                false,0,false,fontHeightHead,false,true,
                false);
    }

    public void createColumnVertical(){


        for (int i = 1; i < 25; i++){
            int firstRow = cellsFirst.get(i-1);
            String nameCol = nameColumnsVerticals.get(i-1);

            setDefaultSettings(firstRow,17, i, i, nameCol,HorizontalAlignment.CENTER,
                    true, 90, false, fontHeightHead, false, false,
                    true);

        }


    }

    public void createBorder(){

        for (int row = 19; row < 23; row++){
            Row rowCurrent = sheet.getRow(row);
            if (rowCurrent == null) rowCurrent = sheet.createRow(row);
            for (int col = 1; col < 25; col++){
                Cell cell = rowCurrent.getCell(col);
                if (cell == null) cell = rowCurrent.createCell(col);
                setDefaultSettings(row,row,col,col,null,HorizontalAlignment.CENTER,
                        true,0,false,fontHeightHead,false,false,
                        true);
            }
        }
    }

    public void createColumnHorizontal(){


        for (int i = 0; i < 12; i++){
            int firstRow = RowFirst.get(i);
            int rowEnd = RowEnd.get(i);
            int colFirst = ColFirst.get(i);
            int colEnd = ColEnd.get(i);

            String nameCol = nameColumnsHorizontal.get(i);

            setDefaultSettings(firstRow,rowEnd, colFirst, colEnd, nameCol,HorizontalAlignment.CENTER,
                    true, 0, false, fontHeightHead, false, false,
                    true);

        }


    }

    public ResponseEntity<byte[]> exportToExcel(List<Journal> journals, String date1, String date2) throws IOException {



        setSizeColumn();

        createHeadRight();
        createHeadLeft();
        createTitle(date1,date2);

        createColumnVertical();
        createColumnHorizontal();

        createNumsRow();
        createColumnReport();

        createBorder();

        // Запись в поток
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        workbook.write(outputStream);
        workbook.close();

        byte[] bytes = outputStream.toByteArray();

        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=data.xlsx");


        return ResponseEntity.ok()
                .headers(headers)
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(bytes);
    }
}
