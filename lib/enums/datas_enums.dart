class DatasEnums {
  static String getDiaSemana(DateTime data) {
    if (data.weekday == 0) return 'Domingo';
    if (data.weekday == 1) return 'Segunda-feira';
    if (data.weekday == 2) return 'Terça-feira';
    if (data.weekday == 3) return 'Quarta-feira';
    if (data.weekday == 4) return 'Quinta-feira';
    if (data.weekday == 5) return 'Sexta-feira';
    if (data.weekday == 6) return 'Sábado';

    return '';
  }

  static String getMesAno(DateTime data) {
    if (data.month == 1) return 'Janeiro ' + data.year.toString();
    if (data.month == 2) return 'Fevereiro ' + data.year.toString();
    if (data.month == 3) return 'Março ' + data.year.toString();
    if (data.month == 4) return 'Abril ' + data.year.toString();
    if (data.month == 5) return 'Maio ' + data.year.toString();
    if (data.month == 6) return 'Junho ' + data.year.toString();
    if (data.month == 7) return 'Julho ' + data.year.toString();
    if (data.month == 8) return 'Agosto ' + data.year.toString();
    if (data.month == 9) return 'Setembro ' + data.year.toString();
    if (data.month == 10) return 'Outubro ' + data.year.toString();
    if (data.month == 11) return 'Novembro ' + data.year.toString();
    if (data.month == 12) return 'Dezembro ' + data.year.toString();

    return '';
  }

  static String getMesAbreviado(DateTime data) {
    if (data.month == 1) return 'JAN';
    if (data.month == 2) return 'FEV';
    if (data.month == 3) return 'MAR';
    if (data.month == 4) return 'ABR';
    if (data.month == 5) return 'MAI';
    if (data.month == 6) return 'JUN';
    if (data.month == 7) return 'JUL';
    if (data.month == 8) return 'AGO';
    if (data.month == 9) return 'SET';
    if (data.month == 10) return 'OUT';
    if (data.month == 11) return 'NOV';
    if (data.month == 12) return 'DEZ';

    return '';
  }
}
