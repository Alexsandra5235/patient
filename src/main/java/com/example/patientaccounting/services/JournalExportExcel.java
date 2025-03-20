package com.example.patientaccounting.services;
import com.example.patientaccounting.models.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import java.io.*;
import java.time.LocalDateTime;
import java.util.*;
import static com.example.patientaccounting.Constants.*;

@Service
@Slf4j
@RequiredArgsConstructor
public class JournalExportExcel {

    private final ReportService reportService;

    Row rowCurrent;
    Cell cellCurrent;

    /**
     * Метод для применения основных настроек текста в ячейке
     */
    private void setDefaultSettings(Workbook workbook,Sheet sheet, int firstRow, int endRow, int firstCol, int endCol, String nameCol,
                                    HorizontalAlignment alignment, Boolean border, int rotation,
                                    boolean underline, int fontHeight, boolean bold, boolean borderButton,
                                    boolean wrapText){

        CellStyle style = workbook.createCellStyle();
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

        // Получение ячейки для установки значения
        rowCurrent = sheet.getRow(firstRow);
        if (rowCurrent == null) rowCurrent = sheet.createRow(firstRow);

        cellCurrent = rowCurrent.getCell(firstCol);
        if (cellCurrent == null) cellCurrent = rowCurrent.createCell(firstCol);

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

    /**
     * Создание шапки страницы (слева)
     */
    public void createHeadLeft(Workbook workbook,Sheet sheet){

        for(int i = 0; i < 5; i++){

            if (i == 4) setDefaultSettings(workbook,sheet,i,i,0,4,headsLeft.get(i),
                    HorizontalAlignment.CENTER, false,0, true, fontHeightHead,
                    false, false, true);

            else setDefaultSettings(workbook,sheet,i,i,0,4,headsLeft.get(i),HorizontalAlignment.LEFT,
                    false,0, false, fontHeightHead, false, false,
                    true);
        }

    }

    /**
     * Создание шапки страницы (справа)
     */
    public void createHeadRight(Workbook workbook,Sheet sheet){

        for (int i = 2; i < 6; i++){
            setDefaultSettings(workbook,sheet,i,i,19,24, headsRight.get(i-2),HorizontalAlignment.CENTER,
                    false,0, false, fontHeightHead, false, false,
                    true);
        }
        setDefaultSettings(workbook,sheet,0,0,19,21,order,HorizontalAlignment.RIGHT,
                false,0, false, fontHeightHead, false, false,
                true);
        setDefaultSettings(workbook,sheet,0,0,22,24,null, HorizontalAlignment.CENTER,
                false,0, false, fontHeightHead, false, true,
                true);

    }

    /**
     * Создание шапки страницы (справа)
     */
    public void createHeadRightSummarySheet(Workbook workbook,Sheet sheet){

        for (int i = 2; i < 6; i++){
            if (i==3) setDefaultSettings(workbook,sheet,i,i,19,24, "Учетная форма № 016/y",HorizontalAlignment.CENTER,
                    false,0, false, fontHeightHead, false, false,
                    true);
            else setDefaultSettings(workbook,sheet,i,i,19,24, headsRight.get(i-2),HorizontalAlignment.CENTER,
                    false,0, false, fontHeightHead, false, false,
                    true);
        }
        setDefaultSettings(workbook,sheet,0,0,19,21,order,HorizontalAlignment.RIGHT,
                false,0, false, fontHeightHead, false, false,
                true);
        setDefaultSettings(workbook,sheet,0,0,22,24,null, HorizontalAlignment.CENTER,
                false,0, false, fontHeightHead, false, true,
                true);

    }

    /**
     * Генерация шапки (центр страницы)
     */
    public void createTitle(Workbook workbook, Sheet sheet,String date1, String date2){

        String title3 = "за период с " + date1 + " 08:00 по " + date2 + " 07:59";

        List<String> titles = List.of(title1, title2, title3, title4);

        for (int i = 8; i < 12; i++){
            if (i == 11) setDefaultSettings(workbook,sheet,i,i,0,24, titles.get(i-8), HorizontalAlignment.CENTER,
                    false,0,false, fontHeightHead,false, false,
                    true);
            else setDefaultSettings(workbook,sheet,i,i,0,24, titles.get(i-8), HorizontalAlignment.CENTER,
                    false,0,false, fontHeightTitle,true, false,
                    true);
        }
    }

    /**
     * Генерация шапки (центр страницы)
     */
    public void createTitleSummarySheet(Workbook workbook, Sheet sheet,String date1, String date2){

        String title4 = "за период с " + date1 + " 08:00 по " + date2 + " 07:59";

        List<String> titles = List.of(titleSummary1, titleSummary2, titleSummary3, title4, titleSummary4);

        for (int i = 8; i < 13; i++){
            if (i == 12) setDefaultSettings(workbook,sheet,i,i,0,23, titles.get(i-8), HorizontalAlignment.CENTER,
                    false,0,false, fontHeightHead,false, false,
                    true);
            else setDefaultSettings(workbook,sheet,i,i,0,23, titles.get(i-8), HorizontalAlignment.CENTER,
                    false,0,false, fontHeightTitle,true, false,
                    true);
        }
    }

    /**
     * Генерация глав (нумерация колонок)
     */
    public void createNumsRow(Workbook workbook, Sheet sheet){

        for (int i = 0; i < 10; i++){
            setDefaultSettings(workbook,sheet,18,18,i,i, String.valueOf(i+1),HorizontalAlignment.CENTER,
                    true,0,false,fontHeightHead,false,false,
                    true);
        }
        for (int i = 13; i < 25; i++){
            setDefaultSettings(workbook,sheet,18,18,i,i, String.valueOf(i-1),HorizontalAlignment.CENTER,
                    true,0,false,fontHeightHead,false,false,
                    true);
        }
        setDefaultSettings(workbook,sheet,18,18,10,10, "10A",HorizontalAlignment.CENTER,
                true,0,false,fontHeightHead,false,false,
                true);
        setDefaultSettings(workbook,sheet,18,18,11,11, "11",HorizontalAlignment.CENTER,
                true,0,false,fontHeightHead,false,false,
                true);
        setDefaultSettings(workbook,sheet,18,18,12,12, "11A",HorizontalAlignment.CENTER,
                true,0,false,fontHeightHead,false,false,
                true);
    }
    /**
     * Генерация глав (нумерация колонок)
     */
    public void createNumsRowSummerySheet(Workbook workbook, Sheet sheet){
        for (int i = 0; i < 24; i++){
            setDefaultSettings(workbook,sheet,19,19,i,i, String.valueOf(i+1),HorizontalAlignment.CENTER,
                    true,0,false,fontHeightHead,false,false,
                    true);
        }
    }

    /**
     * Измнение размеров ячеек
     */
    public void setSizeColumn(Sheet sheet){

        // Устанавливаем ширину столбца для лучшего отображения
        sheet.setColumnWidth(0, 9000); // Измените значение по необходимости

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

    /**
     * Измнение размеров ячеек
     */
    public void setSizeColumnSummarySheet(Sheet sheet){

        // Устанавливаем ширину столбца для лучшего отображения
        sheet.setColumnWidth(0, 9000);

        for (int i = 15; i < 19; i++){
            // Устанавливаем высоту 18-й строки
            rowCurrent = sheet.getRow(i); // Индекс 17 соответствует 18-й строке
            if (rowCurrent == null) {
                rowCurrent = sheet.createRow(i);
            }

            if (i != 18) rowCurrent.setHeightInPoints(32);
            else rowCurrent.setHeightInPoints(200);

        }
    }

    /**
     * Генерация заголовков строк, которые показывают итоговые данные по отчету
     */
    public void createColumnReport(Workbook workbook,Sheet sheet){

        setDefaultSettings(workbook,sheet,19,19,0,0,nameRowTotal,HorizontalAlignment.RIGHT,
                true,0,false,fontHeightHead,true,false,
                true);

        setDefaultSettings(workbook,sheet,20,20,0,0,nameRowDayHospital,HorizontalAlignment.LEFT,
                true,0,false,fontHeightTableReport,true,false,
                true);
        for (int i = 21; i < 23; i++){
            setDefaultSettings(workbook,sheet,i,i,0,0, nameRowsReport.get(i-21), HorizontalAlignment.RIGHT,
                    true,0,false,fontHeightHead,false,false,
                    false);
        }
        setDefaultSettings(workbook,sheet,25,25,16,18,endRow,HorizontalAlignment.RIGHT,
                false,0,false,fontHeightHead,false,false,
                true);
        setDefaultSettings(workbook,sheet,25,25,19,21,null,HorizontalAlignment.CENTER,
                false,0,false,fontHeightHead,false,true,
                false);
    }

    /**
     * Генерация заголовков строк, которые показывают итоговые данные по отчету
     */
    public void createColumnReportSummarySheet(Workbook workbook,Sheet sheet){

        setDefaultSettings(workbook,sheet,20,20,0,0,nameRowTotal,HorizontalAlignment.RIGHT,
                true,0,false,fontHeightHead,true,false,
                true);

        setDefaultSettings(workbook,sheet,21,21,0,0,nameRowDayHospital,HorizontalAlignment.LEFT,
                true,0,false,fontHeightTableReport,true,false,
                true);
        for (int i = 22; i < 24; i++){
            setDefaultSettings(workbook,sheet,i,i,0,0, nameRowsReport.get(i-22), HorizontalAlignment.RIGHT,
                    true,0,false,fontHeightHead,false,false,
                    false);
        }

    }

    /**
     * Генерация колонок с вертикальным отображением текста
     */
    public void createColumnVertical(Workbook workbook, Sheet sheet){
        for (int i = 1; i < 25; i++){
            int firstRow = cellsFirst.get(i-1);
            String nameCol = nameColumnsVerticals.get(i-1);

            setDefaultSettings(workbook,sheet,firstRow,17, i, i, nameCol,HorizontalAlignment.CENTER,
                    true, 90, false, fontHeightHead, false, false,
                    true);

        }
    }
    /**
     * Генерация колонок с вертикальным отображением текста
     */
    public void createColumnVerticalSummarySheet(Workbook workbook, Sheet sheet){
        for (int i = 1; i < 24; i++){
            int firstRow = cellsFirstVerticalSummarySheet.get(i-1);
            String nameCol = nameColumnsVerticalsSummarySheet.get(i-1);

            setDefaultSettings(workbook,sheet,firstRow,18, i, i, nameCol,HorizontalAlignment.CENTER,
                    true, 90, false, fontHeightHead, false, false,
                    true);

        }
    }

    /**
     * Генерация границ таблицы
     */
    public void createBorder(Workbook workbook, Sheet sheet){
        for (int row = 19; row < 23; row++){
            for (int col = 1; col < 25; col++){
                setDefaultSettings(workbook,sheet,row,row,col,col,null,HorizontalAlignment.CENTER,
                        true,0,false,fontHeightHead,false,false,
                        true);
            }
        }
    }
    /**
     * Генерация границ таблицы
     */
    public void createBorderSummarySheet(Workbook workbook, Sheet sheet){
        for (int row = 20; row < 24; row++){
            for (int col = 1; col < 24; col++){
                setDefaultSettings(workbook,sheet,row,row,col,col,null,HorizontalAlignment.CENTER,
                        true,0,false,fontHeightHead,false,false,
                        true);
            }
        }
    }

    /**
     * Генерация колонок с горизонтальным отображением текста
     */
    public void createColumnHorizontal(Workbook workbook, Sheet sheet){
        for (int i = 0; i < 12; i++){
            int firstRow = RowFirst.get(i);
            int rowEnd = RowEnd.get(i);
            int colFirst = ColFirst.get(i);
            int colEnd = ColEnd.get(i);

            String nameCol = nameColumnsHorizontal.get(i);

            setDefaultSettings(workbook,sheet,firstRow,rowEnd, colFirst, colEnd, nameCol,HorizontalAlignment.CENTER,
                    true, 0, false, fontHeightHead, false, false,
                    true);
        }
    }

    /**
     * Генерация колонок с горизонтальным отображением текста
     */
    public void createColumnHorizontalSummarySheet(Workbook workbook, Sheet sheet){
        for (int i = 0; i < 12; i++){
            int firstRow = RowFirstSummarySheet.get(i);
            int rowEnd = RowEndSummarySheet.get(i);
            int colFirst = ColFirstSummarySheet.get(i);
            int colEnd = ColEndSummarySheet.get(i);

            String nameCol = nameColumnsHorizontalSummarySheet.get(i);

            setDefaultSettings(workbook,sheet,firstRow,rowEnd, colFirst, colEnd, nameCol,HorizontalAlignment.CENTER,
                    true, 0, false, fontHeightHead, false, false,
                    true);
        }
    }

    /**
     * Генерация итоговых значений в таблице по итогам отчетного периода
     */
    public void setReportData(Workbook workbook,Sheet sheet,List<Log> logs){

        setDefaultSettings(workbook,sheet,19,19,3,3,String.valueOf(logs.size()),
                HorizontalAlignment.CENTER,true,0,false,fontHeightHead,
                true,false,true);
        setDefaultSettings(workbook,sheet,19,19,20,20,String.valueOf(logs.size()),
                HorizontalAlignment.CENTER,true,0,false,fontHeightHead,
                true,false,true);
        setDefaultSettings(workbook,sheet,20,20,3,3,String.valueOf(logs.size()),
                HorizontalAlignment.CENTER,true,0,false,fontHeightTableReport,
                true,false,true);
        setDefaultSettings(workbook,sheet,20,20,20,20,String.valueOf(logs.size()),
                HorizontalAlignment.CENTER,true,0,false,fontHeightTableReport,
                true,false,true);
        setDefaultSettings(workbook,sheet,22,22,3,3,String.valueOf(logs.size()),
                HorizontalAlignment.CENTER,true,0,false,fontHeightHead,
                false,false,true);
        setDefaultSettings(workbook,sheet,22,22,20,20,String.valueOf(logs.size()),
                HorizontalAlignment.CENTER,true,0,false,fontHeightHead,
                false,false,true);
    }

    /**
     * Генерация глав (номера колонок) на странице 2
     */
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
                        false,fontHeightHead,false,false,true);
            }

            setDefaultSettings(workbook,sheet,firstRow,rowEnd,colFirst,colEnd,
                    nameColumnsSheetPatient.get(i),HorizontalAlignment.CENTER,true,0,
                    false,fontHeightHead,false,false,true);

        }
        setDefaultSettings(workbook,sheet,7,7,0,18,
                nameRowDayHospital,HorizontalAlignment.CENTER,true,0,
                false,fontHeightTableReport,true,false,true);
    }

    /**
     * Генерация отчетных данных по результатам отчетного периода на странице 2
     */
    public void setReportDataSheetTwo(Workbook workbook,Sheet sheet,List<Log> logs){

        for (int i = 0; i < logs.size(); i++){

            setDefaultSettings(workbook,sheet,i+8,i+8,0,2,
                    String.join(" ", logs.get(i).getPatient().getFull_name(), "\n№",
                            logs.get(i).getId().toString()), HorizontalAlignment.LEFT,true,
                    0,false, fontHeightHead,false,false,true);

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
                        false, fontHeightHead, false, false, true);

            }
        }
    }

    /**
     * Заполнение документа
     */
    private Workbook setSettings(List<Log> logs, String date1, String date2){
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

        setReportData(workbook,sheet, logs);

        createColumnsSheetPatient(workbook,sheetPatient);

        setReportDataSheetTwo(workbook,sheetPatient, logs);

        return workbook;
    }

    /**
     * Заполнение документа
     */
    private Workbook setSettingsSummarySheet(List<Log> logs, String date1, String date2){
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Результат");

        setSizeColumnSummarySheet(sheet);

        createHeadRightSummarySheet(workbook,sheet);
        createHeadLeft(workbook,sheet);
        createTitleSummarySheet(workbook,sheet,date1,date2);

        createColumnVerticalSummarySheet(workbook,sheet);
        createColumnHorizontalSummarySheet(workbook,sheet);

        createNumsRowSummerySheet(workbook,sheet);
        createColumnReportSummarySheet(workbook,sheet);

        createBorderSummarySheet(workbook,sheet);



        return workbook;
    }

    /**
     * Сохранение отчета в базе данных
     */
    private void saveReport(String typeReport, String date1, String date2, byte[] bytes){

        // Сохранение в базе данных
        Report report = new Report();
        report.setFileName(date1 + " - " + date2);
        report.setFileContent(bytes);
        report.setCreatedAt(LocalDateTime.now());
        if (Objects.equals(typeReport, "day")){
            report.setTypeReport("Ежедневный отчет");
        }
        else if (Objects.equals(typeReport, "month")){
            report.setTypeReport("Ежемесячный отчет");
        }

        reportService.saveReportByBD(report);
    }

    /**
     * Генерация отчета с его сохранением в базе данных и на локальной машине пользователя
     */
    public ResponseEntity<byte[]> exportToExcel(List<Log> logs, String date1, String date2, String typeReport) throws IOException {

        byte[] bytes = readOutputStream(setSettings(logs,date1,date2));
        HttpHeaders headers = setHeadersForExport(date1,date2);
        saveReport(typeReport,date1, date2, bytes);

        return ResponseEntity.ok()
                .headers(headers)
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(bytes);
    }

    /**
     * Генерация отчета с его сохранением в базе данных и на локальной машине пользователя
     */
    public ResponseEntity<byte[]> exportToExcelSummarySheet(List<Log> logs, String date1, String date2, String typeReport) throws IOException {

        byte[] bytes = readOutputStream(setSettingsSummarySheet(logs,date1,date2));
        HttpHeaders headers = setHeadersForExport(date1,date2);
        saveReport(typeReport,date1, date2, bytes);

        return ResponseEntity.ok()
                .headers(headers)
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(bytes);
    }

    /**
     * Генерация отчета и его открытие без скачивания
     */
    public ResponseEntity<byte[]> openToExcel(List<Log> logs, String date1, String date2) throws IOException {

        byte[] bytes = readOutputStream(setSettings(logs,date1,date2));
        HttpHeaders headers = setHeadersForOpen(date1,date2);
        return new ResponseEntity<>(bytes, headers, HttpStatus.OK);
    }

    /**
     * Назначение заголовка для открытия отчета без его скачивания
     */
    private HttpHeaders setHeadersForOpen(String date1, String date2){
        HttpHeaders headers = new HttpHeaders();

        String headerTitle = "report " + date1 + " " + date2 + ".xlsx";
        String headerValue = "inline; filename=" + headerTitle;

        headers.add(HttpHeaders.CONTENT_DISPOSITION, headerValue);
        headers.add(HttpHeaders.CONTENT_TYPE, "application/vnd.ms-excel");

        return headers;
    }

    /**
     * Назначение заголовка для скачивания отчета
     */
    private HttpHeaders setHeadersForExport(String date1, String date2){
        HttpHeaders headers = new HttpHeaders();

        String headerTitle = "report " + date1 + " " + date2 + ".xlsx";
        String headerValue = "attachment; filename=" + headerTitle;
        headers.add(HttpHeaders.CONTENT_DISPOSITION, headerValue);
        headers.add(HttpHeaders.CONTENT_TYPE, "application/vnd.ms-excel");

        return headers;
    }

    /**
     * Запись данных отчета в документ
     */
    private byte[] readOutputStream(Workbook workbook) throws IOException {
        // Запись в поток
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        workbook.write(outputStream);
        workbook.close();

        return outputStream.toByteArray();
    }

}
