import 'package:intl/intl.dart';

class Formatter {

  static String currency(double? amount) {
    if (amount == null) {
      return '';
    }
    final format = NumberFormat("#,###", "vi_VN");
    return format.format(amount);
  }

  static String dateTime(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    final format = DateFormat('yyyy-MM-dd');
    return format.format(dateTime);  

  }

  static String time(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    final format = DateFormat.Hm();
    return format.format(dateTime);  
  }
}
