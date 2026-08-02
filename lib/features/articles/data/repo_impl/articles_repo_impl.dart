import 'package:injectable/injectable.dart';
import 'package:news/features/articles/domain/repo/articles_repo.dart';

import '../datasource/articles/articles_dao.dart';
import '../model/articles_response/Articles_response.dart';

@Injectable(as: ArticlesRepo)
class ArticlesRepoImpl implements ArticlesRepo{
  ArticlesDao articlesDao;
  ArticlesRepoImpl(this.articlesDao);
  @override
  Future<ArticlesResponse> fetchArticles(String sourceId) {
    return articlesDao.fetchArticles(sourceId);
  }
}