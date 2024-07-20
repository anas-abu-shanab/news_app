import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/shared_pref.dart';
import '../../../../utils/theme_manager.dart';
import '../../../view_model/home_view_model.dart';

class ChangeThemeIcon extends StatelessWidget {
  const ChangeThemeIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = SharedPref.instance.isDarkMode();
    return GestureDetector(
      onTap: () {
        SharedPref.instance.setIsDarkMode(!isDark);
        Get.find<HomeViewModel>().update();
        Get.changeTheme(getApplicationTheme(context));
      },
      child: isDark
          ? const Icon(
        Icons.light_mode,
        color: Colors.amberAccent,
      )
          : const Icon(
        Icons.dark_mode,
        color: Colors.black54,
      ),
    );
  }
}