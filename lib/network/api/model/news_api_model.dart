import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../../feature/model/error_response.dart';
import '../../../feature/model/news_model.dart';
import '../dio_manager/dio_manage_class.dart';

class NewsApiModel {
  NewsApiModel._();

  static final NewsApiModel getInstance = NewsApiModel._();


  Future<Either<ErrorResponse, NewsModel>>
  getNews(
      {var url, var header , var queryParameters}) async {
    try {
      var response = await DioManagerClass.getInstance.dioGetMethod(
          url: url, header: header,queryParameters: queryParameters);

      return Right(NewsModel.fromJson(
          json.decode(response.toString())));
    } on DioException catch (e) {
      var decode = jsonDecode(e.response.toString());
      return Left(ErrorResponse.fromJson(decode, e.response!.statusCode!));
    }
  }

}