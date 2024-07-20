import 'package:flutter/material.dart';
import 'package:news_app/utils/shared_pref.dart';

class AppColors {
  //todo for main colors
  static Color whiteColor(BuildContext context) =>
      (SharedPref.instance.isDarkMode())
          ? const Color(0xFF000000)
          : const Color(0xFFFFFFFF);

  static Color blackColor(BuildContext context) =>
      (SharedPref.instance.isDarkMode())
          ? const Color(0xFFFFFFFF)
          : const Color(0xFF000000);

  static Color colorScaffold(BuildContext context) => !(SharedPref.instance.isDarkMode())
      ? const Color(0xffF5F5F5)
      : const Color(0xFF222831);

  static Color colorPrimary(BuildContext context) => (SharedPref.instance.isDarkMode())
      ? const Color(0xFF5B84B4)
      : const Color(0xFF406B99);

  static Color newsCardColor(BuildContext context) =>
      !(SharedPref.instance.isDarkMode()) ? const Color(
          0xFFF6F5F2)
          : const Color(0xFF393E46);

  static Color colorTextHint(BuildContext context) =>
      !(SharedPref.instance.isDarkMode())
          ? const Color(0xff989898)
          : const Color(0xffCECECE);

  static Color colorTextDarkHint(BuildContext context) =>
      !(SharedPref.instance.isDarkMode())
          ? const Color(0xFF555555)
          : const Color(0xFFA1A1A1);

  static Color appBarColor(BuildContext context) => (SharedPref.instance.isDarkMode()) ? const Color(0xFF292929)
      : const Color(0xFFFFFFFF);

  static Color linkTextColor(BuildContext context) =>
      (SharedPref.instance.isDarkMode())
          ? const Color(0xFF3572EF)
          : const Color(0xFF3572EF);
}
