import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/articles_response/Articles_response.dart';
import '../../../data/model/sources_response/Sources_response.dart';
import '../../resources/app_constants.dart';

@singleton
class ApiManager {

  static Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://newsapi.org"
    )
  );

   Future<SourcesResponse> getSources(String selectedCategory)async{
    var response = await dio.get("/v2/top-headlines/sources",queryParameters: {
      "apiKey":AppConstants.apiKey,
      "category":selectedCategory
    });
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(response.data);
    return sourcesResponse;
  }

   Future<ArticlesResponse> getArticles(String sourceId)async{
    //?sources=bbc-sport
    var response = await dio.get("/v2/everything",queryParameters: {
      "apiKey":AppConstants.apiKey,
      "sources":sourceId
    });
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(response.data);
    return articlesResponse;
  }
}