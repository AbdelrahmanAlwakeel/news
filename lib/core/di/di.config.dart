// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../articles_repo.dart' as _i1047;
import '../../data/datasource/articles/articles_dao.dart' as _i85;
import '../../data/datasource/sources/sources_dao.dart' as _i173;
import '../../data/datasource_impl/articles_api/articles_api_dao_impl.dart'
    as _i1034;
import '../../data/datasource_impl/sources_api/sources_api_dao_impl.dart'
    as _i862;
import '../../data/repo_impl/articles/articles_repo_impl.dart' as _i999;
import '../../data/repo_impl/sources/sources_repo_impl.dart' as _i508;
import '../../sources_repo.dart' as _i613;
import '../../ui/artices/screen/view_model/suorces_view_model.dart' as _i291;
import '../../ui/artices/widgets/view_model/articles_list_view_model.dart'
    as _i862;
import '../remote/network/api_manager.dart' as _i133;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i133.ApiManager>(() => _i133.ApiManager());
    gh.factory<_i85.ArticlesDao>(
      () => _i1034.ArticlesApiDaoImpl(gh<_i133.ApiManager>()),
    );
    gh.factory<_i173.SourcesDao>(
      () => _i862.SourcesApiDaoImpl(gh<_i133.ApiManager>()),
    );
    gh.factory<_i613.SourcesRepo>(
      () => _i508.SourcesRepoImpl(gh<_i173.SourcesDao>()),
    );
    gh.factory<_i291.SourcesViewModel>(
      () => _i291.SourcesViewModel(gh<_i613.SourcesRepo>()),
    );
    gh.factory<_i1047.ArticlesRepo>(
      () => _i999.ArticlesRepoImpl(gh<_i85.ArticlesDao>()),
    );
    gh.factory<_i862.ArticlesListViewModel>(
      () => _i862.ArticlesListViewModel(gh<_i1047.ArticlesRepo>()),
    );
    return this;
  }
}
