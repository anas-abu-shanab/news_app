import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:news_app/feature/model/news_model.dart';
import '../utils/constance_hive.dart';

class NewsBox {
  static NewsBox instance = NewsBox._();

  NewsBox._();

  factory NewsBox() => instance;

  var box = Hive.box(ConstanceHive.newsBoxKey);

  List<Article> defaultList = [];


  getArticlesList() {
    try {
      var list = box.get(ConstanceHive.articleListKey , defaultValue: defaultList);
      box.put(ConstanceHive.articleListKey, list);
      return list;
    } catch (e) {
      log("getArticlesList hive e : $e");
      return [];
    }
  }


  addArticle(Article article) {
    try {
      var articles = getArticlesList();
      if(articles.contains(article)){
        log("addNewArticle , Article is exist");
      }else{
        articles.add(article);
        box.put(ConstanceHive.articleListKey, articles);
        log("addNewArticle , Article added");
      }
    } catch (e) {
      log("addNewArticle hive e : $e");
    }
  }


  deleteArticle({required String url}) async {
    try {
      var articles = getArticlesList();
      var toRemove = [];

      for(var article in articles){
        if(article.url == url){
          toRemove.add(article);
        }
      }
      articles.removeWhere( (e) => toRemove.contains(e));
      box.put(ConstanceHive.articleListKey, articles);
      await box.delete(url);
    } catch (e) {
      log("deleteArticle hive e : $e");
      throw Exception(e);
    }
  }

  getSavedArticle() async {
    try {
      var articles = getArticlesList();
      return articles;
    } catch (e) {
      log("getSavedArticle hive e : $e");
      return [];
    }
  }

}
