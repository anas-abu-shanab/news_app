// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/feature/view/AppWidgets/Custom_image.dart';
import 'package:news_app/feature/view/HomeScreen/home_screen.dart';

import '../../../utils/app_dimen.dart';
import '../../../utils/app_share_method.dart';
import '../HomeScreen/binding/home_binding.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    redirect();
    return Scaffold(
      body: Center(
        child: CustomImage(
          imageSrc: getAppLogoSrc(),
          imageType: 0,
          width: AppDimen.w350,
        ),
      ),
    );
  }

  redirect() async {
    Future.delayed(const Duration(seconds: DurationConstant.d2)).then((value){
      Get.offAll(() => const HomeScreen() , binding: HomeBinding());
    });
  }
}
