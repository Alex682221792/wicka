import 'package:intl/intl.dart';

class FormatUtils {
  static String toShortDateString(DateTime date) {
    final DateFormat formatter = DateFormat('dd-MMM-yyyy');
    return formatter.format(date);
  }
}
