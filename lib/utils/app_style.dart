import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app_colors.dart';




class AppStyleScroll {
  static ScrollPhysics? customScrollViewIOS() =>
      const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
}

class AppShadow {
  static BoxShadow newsCardShadow() {
    return BoxShadow(
        color: Colors.black.withOpacity(.3),
        blurRadius: 5.0, // soften the shadow
        spreadRadius: 3.0, //extend the shadow
        offset: const Offset(
          0.0, // Move to right 10  horizontally
          0.10, // Move to bottom 10 Vertically
        ));
  }
}

//todo for app themes
class AppTextStyle {

  static TextStyle? titleTextStyle() {
    return TextStyle(
        color: AppColors.blackColor(Get.context!),
        fontSize: 16.sp,
        fontWeight: FontWeight.bold);
  }

  static TextStyle? titleDetailsTextStyle() {
    return TextStyle(
        color: AppColors.blackColor(Get.context!),
        fontSize: 20.sp,
        fontWeight: FontWeight.bold);
  }

  static TextStyle? contentTextStyle() {
    return TextStyle(
      color: AppColors.colorTextHint(Get.context!),
      fontSize: 14.sp,
    );
  }

  static TextStyle? contentDetailsTextStyle() {
    return TextStyle(
      color: AppColors.blackColor(Get.context!),
      fontSize: 16.sp,
    );
  }


  static TextStyle? dateTextStyle() {
    return TextStyle(
      color: AppColors.blackColor(Get.context!),
      fontSize: 13.sp,

    );
  }

  static TextStyle? dateDetailsTextStyle() {
    return TextStyle(
      color: AppColors.blackColor(Get.context!),
      fontSize: 15.sp,

    );
  }

  static TextStyle? linkTextStyle() {
    return TextStyle(
      color: AppColors.linkTextColor(Get.context!),
      fontSize: 13.sp,

    );
  }

  static TextStyle? linkDetailsTextStyle() {
    return TextStyle(
      color: AppColors.linkTextColor(Get.context!),
      fontSize: 15.sp,

    );
  }


  static TextStyle? emptySavedTextStyle() {
    return TextStyle(
      color: AppColors.blackColor(Get.context!).withOpacity(0.4),
      fontSize: 18.sp,
    );
  }
}
