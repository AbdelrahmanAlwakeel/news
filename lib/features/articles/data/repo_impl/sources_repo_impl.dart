import 'package:injectable/injectable.dart';

import 'package:news/features/articles/domain/repo/sources_repo.dart';

import '../datasource/sources/sources_dao.dart';
import '../model/sources_response/Sources_response.dart';
@Injectable(as: SourcesRepo)

class SourcesRepoImpl implements SourcesRepo{
  SourcesDao sourcesDao;
  SourcesRepoImpl(this.sourcesDao);
  @override
  Future<SourcesResponse> getSources(String selectedCategory) {
   return sourcesDao.fetchSources(selectedCategory);

  }



}