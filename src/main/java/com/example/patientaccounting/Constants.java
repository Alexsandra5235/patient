package com.example.patientaccounting;

import java.util.ArrayList;
import java.util.List;

public interface Constants {

    String head1 = "Наименование и адрес медицинской организации"; // 1 строка
    String head2 = "(Фамилия, имя, отчество (при наличии) индивидуального"; // 2 строка
    String head3 = "предпринимателя и адрес осуществления  медицинской деятельности)"; // 3 строка
    String head4 = "ОГРН (ОГРНИП)"; // 5 строка
    String head5 = "ГАУЗ \"Кемеровская городская детская клиническая больница №2\""; // 6 строка

    List<String> headsLeft = List.of(head1, head2, head3, head4, head5);

    int fontHeightHead = 10;

    String order1 = "Медицинская документация"; // 3 строка
    String order2 = "Учетная форма № 007/y"; // 4 строка
    String order3 = "Утверждена приказом Министерства"; // 5 строка
    String order4 = "здравоохранения Российской Федерации"; // 6 строка
    String order5 = "от 5 августа 2022 г. № 530н"; // 7 строка

    List<String> headsRight = List.of(order1, order2, order3, order4, order5);

    String title1 = "ЛИСТ ЕЖЕДНЕВНОГО УЧЕТА ДВИЖЕНИЯ ПАЦИЕНТОВ И КОЕЧНОГО ФОНДА МЕДИЦИНСКОЙ ОРГАНИЗАЦИИ,";
    String title2 = "ОКАЗЫВАЮЩЕЙ МЕДИЦИНСКУЮ ПОМОЩЬ В СТАЦИОНАРНЫХ УСЛОВИЯХ, В УСЛОВИЯХ ДНЕВНОГО СТАЦИОНАРА";
    String title4 = "Отделение Дневной стационар (ПНО)";

    int fontHeightTitle = 14;
    int fontHeightTableReport = 11;

    String order = "Код формы по ОКУД";

    String nameColumn1 = "Наименование профиля коек";
    String nameColumn2 = "Число коек";
    String nameColumn3 = "в том числе койки, на которые не осуществляется госпитализация по установленному " +
            "профилю (в переод ремонта и по иным причинам) (из графы 2)";
    String nameColumn4 = "находилось пациентов на начало истекших суток";
    String nameColumn5 = "всего";
    String nameColumn6 = "в том числе из дневного стационара (из графы 5)";
    String nameColumn7 = "сельских жителей";
    String nameColumn8 = "0 - 17 лет";
    String nameColumn9 = "старше трудоспособного возраста";
    String nameColumn10 = "из других отеделений";
    String nameColumn11 = "перемещения внутри отделения";
    String nameColumn12 = "в другие отделения";
    String nameColumn13 = "перемещения внутри отеделения";
    String nameColumn14 = "всего";
    String nameColumn15 = "в том числе (из граыф 12) старше трудоспособного возраста";
    String nameColumn16 = "в дневной стационар (в том числе из графы 12)";
    String nameColumn17 = "в стационар (в том числе из графы 12)";
    String nameColumn18 = "всего";
    String nameColumn19 = "0 - 17 лет";
    String nameColumn20 = "старше трудоспособного возраста";
    String nameColumn21 = "Всего";
    String nameColumn22 = "в том числе (из граыф 19) старше трудоспособного возраста";
    String nameColumn23 = "находилось родителей, законных представителей, иных лиц по уходу за пациентами";
    String nameColumn24 = "мужских";
    String nameColumn25 = "женских";


    List<Integer> cellsFirst = List.of(13,13,14,16,16,17,17,17,17,17,17,17,15,15,16,16,15,16,16,
            17,17,16,17,17);

    List<String> nameColumnsVerticals = List.of(nameColumn2, nameColumn3,nameColumn4,nameColumn5,
            nameColumn6,nameColumn7,nameColumn8,nameColumn9,nameColumn10, nameColumn11,nameColumn12,
            nameColumn13,nameColumn14,nameColumn15,nameColumn16,nameColumn17,nameColumn18,nameColumn19,
            nameColumn20,nameColumn21,nameColumn22,nameColumn23,nameColumn24,nameColumn25);

    List<Integer> RowFirst = List.of(13,13,14,16,14,14,15,14,15,13,16,16);
    List<Integer> RowEnd = List.of(17,13,15,16,16,14,15,14,15,15,16,16);
    List<Integer> ColFirst = List.of(0,3,4,6,9,13,15,17,18,20,20,23);
    List<Integer> ColEnd = List.of(0,19,8,8,12,16,16,19,19,24,21,24);


    String nameColumn26 = "Движение пациентов за истекшие сутки";
    String nameColumn27 = "поступило пациентов (без учета переведенных внутри стационара)";
    String nameColumn28 = "поступило пациентов (из графа 5)";
    String nameColumn29 = "переведено пациентов внутри стационара";
    String nameColumn30 = "выписано пациентов";
    String nameColumn31 = "в том числе из графы 12";
    String nameColumn32 = "умерло";
    String nameColumn33 = "в том числе (из графы 16)";
    String nameColumn34 = "на начало текущего дня";
    String nameColumn35 = "состоит пациентов";
    String nameColumn36 = "свободных мест";

    List<String> nameColumnsHorizontal = List.of(nameColumn1,nameColumn26,nameColumn27,nameColumn28,
            nameColumn29,nameColumn30,nameColumn31,nameColumn32,nameColumn33,nameColumn34,
            nameColumn35,nameColumn36);

    String nameRowTotal = "Итого:";
    String nameRowDayHospital = "Дневной стационар (ПНО)";
    List<String> nameRowsReport = List.of("Дневной ПНО", "Психоневрологичсекие заболевания детей");

    String endRow = "Подпись медсестры";

    String nameColumnSheetPatient1 = "Фамилия, имя, отчество (при наличии) поступившего пациента";
    String nameColumnsSheetPatient2 = "Фамилия, имя, отчество (при наличии) поступившего пациента из " +
            "иной медицинской организации, оказывающей медицинскую помощь в условиях стационара";
    String nameColumnsSheetPatient3 = "Фамилия, имя, отчество (при наличии) выписаного пациента";
    String nameColumnsSheetPatient4 = "Фамилия, имя, отчество (при наличии) переведенного пациента";
    String nameColumnsSheetPatient5 = "в другие отделения данной медицинской организации";
    String nameColumnsSheetPatient6 = "в иную медицинскую организацию, оказывающую медицинскую помощь " +
            "в условиях стационара";
    String nameColumnsSheetPatient7 = "Фамилия, имя, отчество (при наличии) умершего пациента";


    List<String> nameColumnsSheetPatient = List.of(nameColumnSheetPatient1,nameColumnsSheetPatient2,
            nameColumnsSheetPatient3, nameColumnsSheetPatient4, nameColumnsSheetPatient5,
            nameColumnsSheetPatient6, nameColumnsSheetPatient7);

    List<Integer> rowFirstSheetPatient = List.of(0,0,0,0,3,3,0);
    List<Integer> rowEndSheetPatient = List.of(5,5,5,2,5,5,5);
    List<Integer> colFirstSheetPatient = List.of(0,3,6,9,9,12,16);
    List<Integer> colEndSheetPatient = List.of(2,5,8,15,11,15,18);

    List<Integer> colFirstSheetPatientNums = List.of(0,3,6,9,12,16);
    List<Integer> colEndSheetPatientNums = List.of(2,5,8,11,15,18);

    String API_URL = "http://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address";
    String API_URL_COUNTRY = "http://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/country";

    String API_KEY = "Token 261bcf342fdec1c70353bfea95be90efb50e3096";

    List<String> options = List.of("выписан", "переведен в другую медицинскую организацию", "умер");

    List<String> optionsGender = List.of("мужской","женский");

    List<String> optionsDelivered = List.of("полицией","выездной бригадой скорой медицинской помощи","другой медицинской организацией","обратился самостоятельно");

    List<String> optionsReason = List.of("отказался пациент","отсутствие показаний","помощь оказана в приемном отделении медицинской организации","направлен в другую медицинскую организацию","иная причина");

    String nameColumnSummarySheet1 = "Наименование профиля коек";
    String nameColumnSummarySheet2 = "Число коек";
    String nameColumnSummarySheet3 = "Число коек";
    String nameColumnSummarySheet4 = "в том числе койки, на которые не осуществляется госпитализация по установленному " +
            "профилю (в переод ремонта и по иным причинам) (из графы 2)";
    String nameColumnSummarySheet5 = "Среднемесячных (среднегодовых) коек";
    String nameColumnSummarySheet6 = "Состояло пациентов на начало отчетного переода";
    String nameColumnSummarySheet7 = "За отчетный период";
    String nameColumnSummarySheet8 = "Поступило пациентов";
    String nameColumnSummarySheet9 = "Всего";
    String nameColumnSummarySheet10 = "В том числе из дневного стационара";
    String nameColumnSummarySheet11 = "Поступило пациентов (из графы 6)";
    String nameColumnSummarySheet12 = "Сельских жителей";
    String nameColumnSummarySheet13 = "Дети 0-17 лет";
    String nameColumnSummarySheet14 = "Лиц старше трудоспособного возраста";
    String nameColumnSummarySheet15 = "Переведено пациентов внутри стационара";
    String nameColumnSummarySheet16 = "Из других отделений";
    String nameColumnSummarySheet17 = "В другие отделения";
    String nameColumnSummarySheet18 = "Выписано пациентов";
    String nameColumnSummarySheet19 = "Всего";
    String nameColumnSummarySheet20 = "В том числе, лиц старше трудоспособного возраста (из графы 13)";
    String nameColumnSummarySheet21 = "Выписано пациентов (из графы 13)";
    String nameColumnSummarySheet22 = "В дневной стационар";
    String nameColumnSummarySheet23 = "Переведено в стационары";
    String nameColumnSummarySheet24 = "Умерло пациентов";
    String nameColumnSummarySheet25 = "Всего";
    String nameColumnSummarySheet26 = "В том числе (из графы 17)";
    String nameColumnSummarySheet27 = "Дети 0-17 лет";
    String nameColumnSummarySheet28 = "Лиц старше трудоспособного возраста";
    String nameColumnSummarySheet29 = "Состояло пациентов на начало дня после окончания отчетного периода";
    String nameColumnSummarySheet30 = "Проведено пациентами койко-дней в стационаре (пациенто-дней в дневном стационаре)";
    String nameColumnSummarySheet31 = "Всего";
    String nameColumnSummarySheet32 = "В том числе (из графы 21) лицами старше трудоспособного возраста";
    String nameColumnSummarySheet33 = "Кроме того:";
    String nameColumnSummarySheet34 = "Число койко-дней (пациенто-дней) в отношении коек, на которые не осуществлялась " +
            "госпитализация по установленному профилю (в период ремонта и по иным причинам)";
    String nameColumnSummarySheet35 = "Проведено койко-дней (пациенто-дней) по уходу за пациентом";

    List<String> nameColumnsVerticalsSummarySheet = List.of(nameColumnSummarySheet3, nameColumnSummarySheet4,nameColumnSummarySheet5,
            nameColumnSummarySheet6,nameColumnSummarySheet9,nameColumnSummarySheet10,nameColumnSummarySheet12,nameColumnSummarySheet13,
            nameColumnSummarySheet14,nameColumnSummarySheet16,nameColumnSummarySheet17,nameColumnSummarySheet19,nameColumnSummarySheet20,
            nameColumnSummarySheet22,nameColumnSummarySheet23,nameColumnSummarySheet25,nameColumnSummarySheet27,nameColumnSummarySheet28,
            nameColumnSummarySheet29,nameColumnSummarySheet31,nameColumnSummarySheet32,nameColumnSummarySheet34,nameColumnSummarySheet35);


    List<String> nameColumnsHorizontalSummarySheet = List.of(nameColumnSummarySheet1,nameColumnSummarySheet2,nameColumnSummarySheet7,
            nameColumnSummarySheet8,nameColumnSummarySheet11,nameColumnSummarySheet15,nameColumnSummarySheet18,nameColumnSummarySheet21,nameColumnSummarySheet24,
            nameColumnSummarySheet26,nameColumnSummarySheet30,nameColumnSummarySheet33);

    List<Integer> RowFirstSummarySheet = List.of(14,14,14,15,17,15,15,16,15,16,14,16);
    List<Integer> RowEndSummarySheet = List.of(  18,15,14,16,17,17,15,16,15,16,15,16);
    List<Integer> ColFirstSummarySheet = List.of(0, 1, 5, 5, 7, 10,12,14,16,17,20,22);
    List<Integer> ColEndSummarySheet = List.of(  0, 2, 18,9, 9, 11,15,15,18,18,23,23);

    List<Integer> cellsFirstVerticalSummarySheet = List.of(16,16,14,14,17,17,18,18,18,18,18,16,16,17,17,16,17,17,14,16,16,17,17);

    String titleSummary1 = "СВОДНАЯ ВЕДОМОСТЬ УЧЕТА ДВИЖЕНИЯ ПАЦИЕНТОВ И КОНЕЧНОГО ФОНДА";
    String titleSummary2 = "МЕДИЦИНСКОЙ ОРГАНИЗАЦИИ, ОКАЗЫВАЮЩЕЙ МЕДИЦИНСКУЮ ПОМОЩЬ В СТАЦИОНАРНЫХ УСЛОВИЯХ,";
    String titleSummary3 = "В УСЛОВИЯХ ДНЕВНОГО СТАЦИОНАРА";
    String titleSummary4 = "Отделения: ВСЕ";

    List<String> timeProcedures = List.of("09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00");































}
