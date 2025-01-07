package com.example.patientaccounting;

import com.example.patientaccounting.models.Journal;
import org.apache.commons.math3.geometry.euclidean.threed.Rotation;
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

    // Создаем стиль для границ
    CellStyle borderStyle = workbook.createCellStyle();
    CellStyle currentStyle = workbook.createCellStyle();

    CellStyle centeredStyle = workbook.createCellStyle();
    CellStyle leftStyle = workbook.createCellStyle();
    CellStyle rightStyle = workbook.createCellStyle();
    CellStyle rotationStyle = workbook.createCellStyle();

    Row rowCurrent;
    Cell cellCurrent;

    public void setDefaultSettings(int firstRow, int endRow, int firstCol, int endCol, String nameCol,
                                   HorizontalAlignment alignment, Boolean border, int rotation,
                                   boolean underline){

        CellStyle style = workbook.createCellStyle();
        Font font = workbook.createFont();

        // Устанавливаем выравнивание текста
        style.setAlignment(alignment);
        style.setVerticalAlignment(VerticalAlignment.CENTER);
        style.setRotation((short) rotation);
        style.setWrapText(true); // Включаем перенос текста
        // Устанавливаем шрифт
        font.setFontName("Times New Roman"); // Название шрифта
        font.setFontHeightInPoints((short) 10); // Размер шрифта

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

        cellCurrent.setCellValue(nameCol); // Установка значения

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

    private void setBordersForMergedRegion(int startRow, int endRow, int startColumn, int endColumn, CellStyle borderStyle) {
        for (int rowIndex = startRow; rowIndex <= endRow; rowIndex++) {
            Row row = sheet.getRow(rowIndex);
            if (row == null) {
                row = sheet.createRow(rowIndex);
            }
            for (int colIndex = startColumn; colIndex <= endColumn; colIndex++) {
                Cell cell = row.getCell(colIndex);
                if (cell == null) {
                    cell = row.createCell(colIndex);
                }
                cell.setCellStyle(borderStyle); // Применяем стиль границы
            }
        }
    }

    public void setDefaultStyle10(int firstRow, int endRow, int firstCol, int endCol, String nameCol, String typeAlignment){

        Font font = workbook.createFont();

        Row rowCurrent;
        Cell cellCurrent;

        // Создаем стиль для заголовка
        font.setBold(false);
        font.setFontHeightInPoints((short) fontHeightHead); // Установите размер шрифта
        font.setFontName("Times New Roman"); // Устанавливаем шрифт Times New Roman

        leftStyle.setFont(font);

        leftStyle.setAlignment(HorizontalAlignment.LEFT);
        leftStyle.setVerticalAlignment(VerticalAlignment.CENTER);

        // Создание стиля для выравнивания по центру
        centeredStyle.cloneStyleFrom(leftStyle);
        centeredStyle.setAlignment(HorizontalAlignment.CENTER);

        rowCurrent = sheet.getRow(firstRow);
        if (rowCurrent == null) rowCurrent = sheet.createRow(firstRow);

        cellCurrent = rowCurrent.getCell(firstCol);
        if (cellCurrent == null) cellCurrent = rowCurrent.createCell(firstCol);

        cellCurrent.setCellValue(nameCol);

    }

    public void createHeadLeft(){

        for(int i = 0; i < 5; i++){

            if (i == 4) setDefaultSettings(i,i,0,4,headsLeft.get(i),
                    HorizontalAlignment.CENTER, false,0, true);

            else setDefaultSettings(i,i,0,4,headsLeft.get(i),HorizontalAlignment.LEFT,
                    false,0, false);
        }



//        Row row1 = sheet.getRow(0);
//        Cell cell1 = row1.createCell(0);
//        cell1.setCellValue(headsLeft.get(0));
//        // Объединяем ячейки
//        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 4));
//
//        Row row2 = sheet.createRow(1);
//        Cell cell2 = row2.createCell(0);
//        cell2.setCellValue(headsLeft.get(1));
//        // Объединяем ячейки
//        sheet.addMergedRegion(new CellRangeAddress(1, 1, 0, 4));
//
//        // Создайте строки для заголовка
//        for (int i = 2; i <= 4; i++) {
//            Row row = sheet.getRow(i);
//            Cell cell = row.createCell(0);
//            cell.setCellValue(headsLeft.get(i));
//            // Объединяем ячейки
//            sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 4));
//        }
//
//        // Создаем стиль для заголовка
//        CellStyle styleHead = workbook.createCellStyle();
//        Font fontHead = workbook.createFont();
//
//        fontHead.setBold(false);
//        fontHead.setFontHeightInPoints((short) fontHeightHead); // Установите размер шрифта
//        fontHead.setFontName("Times New Roman"); // Устанавливаем шрифт Times New Roman
//
//        styleHead.setFont(fontHead);
//
//        styleHead.setAlignment(HorizontalAlignment.LEFT);
//        styleHead.setVerticalAlignment(VerticalAlignment.CENTER);
//
//        // Применяем стиль к заголовку
//        for (int i = 0; i <= 4; i++) {
//            Row row = sheet.getRow(i);
//            Cell cell = row.getCell(0);
//            cell.setCellStyle(styleHead);
//        }
//
//        CellStyle styleHeadEndRow = workbook.createCellStyle();
//        Font fontHeadEndRow = workbook.createFont();
//
//        fontHeadEndRow.setFontHeightInPoints((short) fontHeightHead); // Установите размер шрифта
//        fontHeadEndRow.setFontName("Times New Roman"); // Устанавливаем шрифт Times New Roman
//        fontHeadEndRow.setUnderline(FontUnderline.SINGLE.getByteValue());
//
//        styleHeadEndRow.setFont(fontHeadEndRow);
//        styleHeadEndRow.setAlignment(HorizontalAlignment.CENTER);
//        styleHeadEndRow.setVerticalAlignment(VerticalAlignment.CENTER);
//
//        Row rowHead = sheet.getRow(4);
//        Cell cellHead = rowHead.getCell(0);
//        cellHead.setCellStyle(styleHeadEndRow);

    }

    public void createHeadRight(){

        // Создайте строки для заголовка
        for (int i = 2; i <= 6; i++) {
            Row row = sheet.createRow(i);
            Cell cell = row.createCell(19);
            cell.setCellValue(headsRight.get(i - 2));
            // Объединяем ячейки
            sheet.addMergedRegion(new CellRangeAddress(i, i, 19, 24));
        }

        Row row = sheet.createRow(0);
        Cell cell = row.createCell(19);
        cell.setCellValue(order);
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 19, 24));

        // Создаем стиль для заголовка
        CellStyle centerAlignStyle = workbook.createCellStyle();
        Font fontCenterAlign = workbook.createFont();

        centerAlignStyle.setAlignment(HorizontalAlignment.CENTER);
        fontCenterAlign.setFontHeightInPoints((short) fontHeightHead);
        fontCenterAlign.setFontName("Times New Roman");
        centerAlignStyle.setFont(fontCenterAlign);

        // Создаем стиль для order
        CellStyle orderStyle = workbook.createCellStyle();
        Font orderFont = workbook.createFont();

        orderStyle.setAlignment(HorizontalAlignment.LEFT);
        orderFont.setFontHeightInPoints((short) fontHeightHead);
        orderFont.setFontName("Times New Roman");
        orderStyle.setFont(orderFont);

        // Создание стиля для нижней границы
        CellStyle borderStyle = workbook.createCellStyle();
        borderStyle.setBorderBottom(BorderStyle.THIN);
        borderStyle.setBottomBorderColor(IndexedColors.BLACK.getIndex());

        // Применяем стиль к заголовку
        for (int i = 2; i <= 6; i++) {
            Row rowFill = sheet.getRow(i);
            Cell cellFill = rowFill.getCell(19);
            cellFill.setCellStyle(centerAlignStyle);
        }

        Row rowOrder = sheet.getRow(0);
        Cell cellOrder = rowOrder.getCell(19);
        cellOrder.setCellStyle(orderStyle);

        // Применяем стиль к заголовку
        for (int i = 21; i <= 24; i++) {
            Row rowBorder = sheet.getRow(0);
            Cell cellBorder = rowBorder.createCell(i);
            cellBorder.setCellStyle(borderStyle);
        }


        Row rowBorder = sheet.getRow(0);
        Cell cellBorder = rowBorder.createCell(22);
        cellBorder.setCellStyle(borderStyle);

    }

    public void createTitle(String date1, String date2){

        String title3 = "за период с " + date1 + " 08:00 по " + date2 + " 07:59";

        List<String> titles = List.of(title1, title2, title3, title4);


        // Создайте строки для заголовка
        for (int i = 8; i <= 11; i++) {
            Row row = sheet.createRow(i);
            Cell cell = row.createCell(0);
            cell.setCellValue(titles.get(i - 8));
            // Объединяем ячейки
            sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 24));
        }



        // Создаем стиль для заголовка
        CellStyle styleTitle = workbook.createCellStyle();
        Font fontTitle = workbook.createFont();
        fontTitle.setBold(true);
        fontTitle.setFontHeightInPoints((short) fontHeightTitle); // Установите размер шрифта
        fontTitle.setFontName("Times New Roman"); // Устанавливаем шрифт Times New Roman
        styleTitle.setFont(fontTitle);
        styleTitle.setAlignment(HorizontalAlignment.CENTER);
        styleTitle.setVerticalAlignment(VerticalAlignment.CENTER);

        // Применяем стиль к заголовку
        for (int i = 8; i <= 11; i++) {
            Row row = sheet.getRow(i);
            Cell cell = row.getCell(0);
            cell.setCellStyle(styleTitle);
        }

        CellStyle styleTitleEndRow = workbook.createCellStyle();
        Font fontTitleEndRow = workbook.createFont();
        fontTitleEndRow.setFontHeightInPoints((short) fontHeightHead); // Установите размер шрифта
        fontTitleEndRow.setFontName("Times New Roman"); // Устанавливаем шрифт Times New Roman
        fontTitleEndRow.setBold(false);
        styleTitleEndRow.setAlignment(HorizontalAlignment.CENTER);
        styleTitleEndRow.setVerticalAlignment(VerticalAlignment.CENTER);
        styleTitleEndRow.setFont(fontTitleEndRow);

        Row rowTitle = sheet.getRow(11);
        Cell cellTitle = rowTitle.getCell(0);
        cellTitle.setCellStyle(styleTitleEndRow);


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

    public void createColumnVertical(){


        for (int i = 1; i < 25; i++){
            int firstRow = cellsFirst.get(i-1);
            String nameCol = nameColumnsVerticals.get(i-1);

            setDefaultSettings(firstRow,17, i, i, nameCol,HorizontalAlignment.CENTER,
                    true, 90, false);

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
                    true, 0, false);

        }


    }

    public ResponseEntity<byte[]> exportToExcel(List<Journal> journals, String date1, String date2) throws IOException {



        setSizeColumn();

        //createHeadRight();
        createHeadLeft();
        //createTitle(date1,date2);

        createColumnVertical();
        createColumnHorizontal();


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
