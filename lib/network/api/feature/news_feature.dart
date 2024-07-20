import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:news_app/feature/model/news_model.dart';

import '../../../feature/model/error_response.dart';
import '../../utils/constance_netwoek.dart';

import '../model/news_api_model.dart';

class NewsFeature{
  NewsFeature._();

  static final NewsFeature getInstance = NewsFeature._();

  Future<Either<ErrorResponse, NewsModel>> getNews(
      {required var queryParameters}) async {

    var response = await NewsApiModel.getInstance.getNews(
        url: ConstanceNetwork.getNewsEndPoint,
        header: ConstanceNetwork.header(TypeToken.Content_Type),
        queryParameters: queryParameters,
    );
    if (response.isRight) {
      log("success ${response.right.toJson()}");
      return response;
    } else {
      log("fail ${response.left.toJson()}");
      return response;
    }
  }

}