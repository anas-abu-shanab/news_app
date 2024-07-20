import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../../utils/app_strings.dart';
import '../../utils/theme_manager.dart';
import '../view/SplashScreen/splash_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          navigatorKey: Get.key /*navigatorKey*/,
          debugShowCheckedModeBanner: false,
          enableLog: true,
          defaultTransition: Transition.native,
          initialBinding: BindingsController(),
          title: AppStrings.appTitle,
          theme: getApplicationTheme(context),
          home: child,
        );

      },
      child: const SplashScreen(),
    );
  }
}
