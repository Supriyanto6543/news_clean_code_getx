import 'package:dio/dio.dart';
import 'package:news_getx/features/data/model/news_category_model.dart';
import 'package:news_getx/features/data/model/news_model.dart';

import '../../../.env.dart';
import '../../../common/constant.dart';

abstract class NewsRemoteData {
  Future get(String path, {Map<String, dynamic>? data});
  Future<List<NewsCategoryModel>> getNewsCategory(String query);
  Future<List<NewsModel>> getNews(String query);
}

class NewsRemoteDateImpl implements NewsRemoteData {
  late final Dio dio;
  Dio get _dio => dio;

  NewsRemoteDateImpl({Dio? services}) {
    dio = services ??
        Dio(BaseOptions(
          baseUrl: baseUrl,
          headers: {},
        ))
      ..interceptors.add(InterceptorsWrapper(onRequest: (opt, handler) {
        return handler.next(opt);
      }))
      ..interceptors
          .add(LogInterceptor(responseBody: false, requestBody: false));
  }

  @override
  Future get(String path, {Map<String, dynamic>? data}) async {
    try {
      Response response = await dio.get(path);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  @override
  Future<List<NewsModel>> getNews(String query) async {
    final request = await _dio.get("$news$query&apiKey=$apiKey");
    final List response = request.data['articles'];
    if (request.statusCode == 200) {
      return response.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  @override
  Future<List<NewsCategoryModel>> getNewsCategory(String query) async {
    final request = await _dio.get("$newsCategory$apiKey&category=$query");
    final List response = request.data['sources'];
    if (request.statusCode == 200) {
      return response.map((e) => NewsCategoryModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
