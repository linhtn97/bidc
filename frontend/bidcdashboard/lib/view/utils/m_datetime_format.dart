import 'package:intl/intl.dart';

String mDateTimeFormat(String val, String preType, String toType) {
  DateTime parseDate = DateFormat(preType).parse(val);
  var inputDate = DateTime.parse(parseDate.toString());
  var outputFormat = DateFormat(toType);
  return outputFormat.format(inputDate);
}
