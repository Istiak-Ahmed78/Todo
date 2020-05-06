import 'package:intl/intl.dart';

DateTimeService dateTimeService = DateTimeService();

class DateTimeService {
  static final now = DateTime.now();
  String ddddyyMMMM = DateFormat('EEEE yy MMMM').format(now);
  String currentTime = DateFormat('jm').format(now);
}
