import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toFormattedString(format) {
    final formatter = DateFormat(format, "ja_JP");
    final formatted = formatter.format(this);
    return formatted;
  }
}
