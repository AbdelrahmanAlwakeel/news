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

import '../../features/articles/data/datasource/articles/articles_dao.dart'
    as _i908;
import '../../features/articles/data/datasource/sources/sources_dao.dart'
    as _i836;
import '../../features/articles/data/datasource_impl/articles_api/articles_api_dao_impl.dart'
    as _i993;
import '../../features/articles/data/datasource_impl/sources_api/sources_api_dao_impl.dart'
    as _i391;
import '../../features/articles/data/repo_impl/articles_repo_impl.dart'
    as _i278;
import '../../features/articles/data/repo_impl/sources_repo_impl.dart' as _i284;
import '../../features/articles/domain/repo/articles_repo.dart' as _i200;
import '../../features/articles/domain/repo/sources_repo.dart' as _i540;
import '../../features/articles/presntation/view_model/articles_list_view_model.dart'
    as _i195;
import '../../features/articles/presntation/view_model/suorces_view_model.dart'
    as _i777;

import '../remote/network/api_manager.dart' as _i133;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i133.ApiManager>(() => _i133.ApiManager());
    gh.factory<_i908.ArticlesDao>(
      () => _i993.ArticlesApiDaoImpl(gh<_i133.ApiManager>()),
    );
    gh.factory<_i836.SourcesDao>(
      () => _i391.SourcesApiDaoImpl(gh<_i133.ApiManager>()),
    );
    gh.factory<_i200.ArticlesRepo>(
      () => _i278.ArticlesRepoImpl(gh<_i908.ArticlesDao>()),
    );
    gh.factory<_i540.SourcesRepo>(
      () => _i284.SourcesRepoImpl(gh<_i836.SourcesDao>()),
    );
    gh.factory<_i777.SourcesViewModel>(
      () => _i777.SourcesViewModel(gh<_i540.SourcesRepo>()),
    );
    gh.factory<_i195.ArticlesListViewModel>(
      () => _i195.ArticlesListViewModel(gh<_i200.ArticlesRepo>()),
    );
    return this;
  }
}
