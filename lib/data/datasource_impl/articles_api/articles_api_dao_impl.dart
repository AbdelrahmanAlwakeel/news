import 'package:injectable/injectable.dart';
import 'package:news/core/remote/network/api_manager.dart';
import 'package:news/data/datasource/articles/articles_dao.dart';

import '../../model/articles_response/Articles_response.dart';
@Injectable(as:ArticlesDao )
class ArticlesApiDaoImpl implements ArticlesDao{
  @override
  ApiManager apiManager;
  ArticlesApiDaoImpl(this.apiManager);
  Future<ArticlesResponse> fetchArticles(String sourceId) {
    return apiManager.getArticles(sourceId);


  }
}