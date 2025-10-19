import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_c16_sun/data/api/api_client.dart';
import 'package:news_c16_sun/data/data_source/news/news_remote_datasource.dart';
import 'package:news_c16_sun/data/data_source/news/news_remote_datasource_impl.dart';
import 'package:news_c16_sun/data/mappers/sources_mpper.dart';
import 'package:news_c16_sun/data/repository/news_repo_impl.dart';
import 'package:news_c16_sun/domain/repository/news_repo.dart';
import 'package:news_c16_sun/domain/use_case/get_sources_use_case.dart';
import 'package:news_c16_sun/presentation/news/news_view_model.dart';

import 'di.dart';

void setup() {
  getIt.registerFactory<NewsRemoteDatasource>(
    () => NewsRemoteDatasourceImpl(getIt<ApiClient>()),
  );
  getIt.registerFactory<SourcesMapper>(()=> SourcesMapper());

}
