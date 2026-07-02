import 'package:injectable/injectable.dart';
import 'package:news/data/model/articles_response/Articles_response.dart';
import 'package:news/data/model/sources_response/Sources_response.dart';
import 'package:news/data/datasource/sources/sources_dao.dart';
import 'package:news/sources_repo.dart';
@Injectable(as: SourcesRepo)

class SourcesRepoImpl implements SourcesRepo{
  SourcesDao sourcesDao;
  SourcesRepoImpl(this.sourcesDao);
  @override
  Future<SourcesResponse> getSources(String selectedCategory) {
   return sourcesDao.fetchSources(selectedCategory);

  }



}