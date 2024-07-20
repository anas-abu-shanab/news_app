import 'package:get/get.dart';

import '../../../view_model/article_details_view_model.dart';


class ArticleDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleDetailsViewModel());
  }

}