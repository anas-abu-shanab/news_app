import 'dart:developer';

import 'package:get/get.dart';
import 'package:news_app/network/api/feature/news_feature.dart';
import 'package:news_app/network/utils/constance_netwoek.dart';

import '../model/news_model.dart';

class HomeViewModel extends GetxController{
  bool isLoading = false;

  List<Article> articles = [];

  void setIsLoading(bool isLoading){
    this.isLoading = isLoading;
    update();
  }

  getNews() async {
    setIsLoading(true);
    Map<String,dynamic> queryParameters = {
      ConstanceNetwork.qKey : "a",
      ConstanceNetwork.countryKey : "us",
      ConstanceNetwork.langKey : "en",
      ConstanceNetwork.maxKey : 10,
      ConstanceNetwork.apikeyKey : ConstanceNetwork.apikey,
    };
    try{
      await NewsFeature.getInstance.getNews(queryParameters: queryParameters).then((value){
        if(value.isRight){
          for(Article article in value.right.articles ?? []){
            if(!articles.contains(article)){
              articles.add(article);
            }
          }
          setIsLoading(false);
        }else{
          log("getNews left : ${value.left.message}");
          setIsLoading(false);
          return;
        }
      });
    }catch(e){
      log("getNews e : $e");
      setIsLoading(false);
      return ;
    }
  }

}