import 'package:intl/intl.dart';
abstract class lan
{
  static bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
}