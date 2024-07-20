import 'package:intl/intl.dart';
import 'package:news_app/utils/assets_manager.dart';
import 'package:news_app/utils/shared_pref.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'app_strings.dart';

String getAppLogoSrc() {
  bool isDark = SharedPref.instance.isDarkMode();

  if (isDark) {
    return AppMedia.darkAppLogo;
  } else {
    return AppMedia.lightAppLogo;
  }
}

String convertUtcToLocalFullDate(DateTime utcDateTime) {
  try {
    initializeDateFormatting('en');
    DateTime dateNew = utcDateTime;
    dateNew = DateTime.utc(dateNew.year, dateNew.month, (dateNew.day),
        dateNew.hour, dateNew.minute);
    dateNew = dateNew.toLocal();
    var dateFormat2 =
        DateFormat("MMM dd yyyy", "en"); // you can change the format here
    String createdDate2 = dateFormat2.format(dateNew);
    return createdDate2;
  } catch (e) {
    return "$e";
  }
}

String getNewsDate(DateTime dateTime){
  DateTime today = DateTime.now();
  DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
  final format = DateFormat('MMM dd yyyy');
  String dateTxt = format.format(dateTime);

  if (format.format(dateTime) == format.format(today)) {
    dateTxt = AppStrings.txtToday;
  } else if (format.format(dateTime) == format.format(yesterday)) {
    dateTxt = AppStrings.txtYesterday;
  }

  return dateTxt;
}

Future<void> openStringLink(String url) async {
  if (await canLaunchUrlString(url)) {
  launchUrlString(url);
  }
}
