import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/shared_pref.dart';

import 'feature/core/app_widget.dart';
import 'hive/hive_config.dart';
import 'network/api/dio_manager/dio_manage_class.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.instance.init();
  await HiveConfig.instance.initHiveListener();
  DioManagerClass.getInstance.init();
  runApp(const AppWidget());
}

class BindingsController extends Bindings {
  @override
  void dependencies() {

  }

}


