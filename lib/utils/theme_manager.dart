import 'package:flutter/material.dart';
import 'package:news_app/utils/app_dimen.dart';

import 'app_colors.dart';

ThemeData getApplicationTheme(BuildContext context) {
  return ThemeData(

    //todo main colors of the app
    scaffoldBackgroundColor: AppColors.colorScaffold(context),
    primaryColor: AppColors.colorPrimary(context),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.colorScaffold(context),
      iconTheme: IconThemeData(
        color: AppColors.blackColor(context),
        size: AppDimen.h30,
      )
    ),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),

    sliderTheme: SliderTheme.of(context).copyWith(
      thumbShape: SliderComponentShape.noThumb,
      trackShape: CustomTrackShape(),
    ),
  );
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}