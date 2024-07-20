

import 'package:get/get.dart';
import 'package:news_app/hive/models/saved_news_box.dart';

import '../model/news_model.dart';

class ArticleDetailsViewModel extends GetxController{

  bool currentIsSaved = false;
  List<Article> savedArticles = [];

  @override
  onInit(){
    super.onInit();
    setSavedArticles();
  }

  setCurrentIsSaved(Article article){
    currentIsSaved = savedArticles.contains(article);
    update();
  }

  setSavedArticles() async {
    savedArticles.clear();
    var list = await NewsBox.instance.getSavedArticle();
    for(var art in list){
      if(!savedArticles.contains(art)){
        savedArticles.add(art);
      }
    }
    update();
  }


  onSaveClick(Article article) async {
    setCurrentIsSaved(article);
    if(currentIsSaved){
    NewsBox.instance.deleteArticle(url: article.url ?? '');
    savedArticles.remove(article);
    }else{
      NewsBox.instance.addArticle(article);
      savedArticles.add(article);
    }
    update();
  }

}