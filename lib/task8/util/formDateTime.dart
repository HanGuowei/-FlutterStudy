import 'package:intl/intl.dart';

extension FormateDateTime on DateTime {
  String formatDateTime() => DateFormat('yyyy/MM/dd').format(this);
}
