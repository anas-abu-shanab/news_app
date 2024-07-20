import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/feature/model/news_model.dart';
import 'package:news_app/hive/utils/constance_hive.dart';


class HiveConfig{

  static HiveConfig instance = HiveConfig._();

  HiveConfig._();

  factory HiveConfig() => instance;

  Future<void> initHiveListener() async {
    try {
      await Hive.initFlutter().then((value) async {
        log("initFlutter");
        await modelConfig();
      });
    } catch (e) {
      log("main hive e : $e");
    }
  }

  Future<void> modelConfig()async {
    await newsBoxConfig();
  }

  Future<void> newsBoxConfig() async {
    Hive.registerAdapter<NewsModel>(NewsModelAdapter());
    Hive.registerAdapter<Article>(ArticleAdapter());
    Hive.registerAdapter<Source>(SourceAdapter());
    await Hive.openBox(ConstanceHive.newsBoxKey);
  }


}