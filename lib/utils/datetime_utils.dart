import 'package:intl/intl.dart';

class DateTimeHelper {
  DateTimeHelper._();

  static String formatDate(DateTime date, String formatString) {
    return DateFormat(formatString).format(date);
  }
}
