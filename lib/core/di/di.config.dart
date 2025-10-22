// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api/api_client.dart' as _i681;
import '../../data/data_source/articles/articles_remote_datasource.dart'
    as _i218;
import '../../data/data_source/articles/articles_remote_datasource_impl.dart'
    as _i636;
import '../../data/data_source/news/news_remote_datasource.dart' as _i35;
import '../../data/data_source/news/news_remote_datasource_impl.dart' as _i56;
import '../../data/mappers/sources_mpper.dart' as _i594;
import '../../data/repository/news_repo_impl.dart' as _i537;
import '../../domain/repository/news_repo.dart' as _i244;
import '../../domain/use_case/get_articles_by_source_use_case.dart' as _i272;
import '../../domain/use_case/get_sources_use_case.dart' as _i860;
import '../../presentation/news/news_view_model.dart' as _i467;
import 'modules/dio_module.dart' as _i983;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.factory<_i594.SourcesMapper>(() => _i594.SourcesMapper());
    gh.lazySingleton<_i361.Dio>(() => dioModule.buildDioObject());
    gh.singleton<_i681.ApiClient>(() => _i681.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i218.ArticlesRemoteDatasource>(
        () => _i636.ArticlesRemoteDatasourceImpl(gh<_i681.ApiClient>()));
    gh.factory<_i35.NewsRemoteDatasource>(
        () => _i56.NewsRemoteDatasourceImpl(gh<_i681.ApiClient>()));
    gh.factory<_i244.NewsRepo>(() => _i537.NewsRepoImpl(
          gh<_i35.NewsRemoteDatasource>(),
          gh<_i594.SourcesMapper>(),
          gh<_i218.ArticlesRemoteDatasource>(),
        ));
    gh.factory<_i272.GetArticlesBySourceUseCase>(
        () => _i272.GetArticlesBySourceUseCase(gh<_i244.NewsRepo>()));
    gh.factory<_i860.GetSourcesUseCase>(
        () => _i860.GetSourcesUseCase(gh<_i244.NewsRepo>()));
    gh.factory<_i467.NewsViewModel>(() => _i467.NewsViewModel(
          gh<_i860.GetSourcesUseCase>(),
          gh<_i272.GetArticlesBySourceUseCase>(),
        ));
    return this;
  }
}

class _$DioModule extends _i983.DioModule {}
