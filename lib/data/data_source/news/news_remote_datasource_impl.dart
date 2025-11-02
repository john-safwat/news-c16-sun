import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:news_c16_sun/core/base/results.dart';
import 'package:news_c16_sun/core/base/safe_call.dart';
import 'package:news_c16_sun/data/api/api_client.dart';
import 'package:news_c16_sun/data/data_source/news/news_remote_datasource.dart';
import 'package:news_c16_sun/data/models/sources_response.dart';

@Injectable(as: NewsRemoteDatasource)
class NewsRemoteDatasourceImpl implements NewsRemoteDatasource {
  ApiClient apiClient;

  NewsRemoteDatasourceImpl(this.apiClient);

  @override
  Future<Results<List<Sources>>> getSources(String categoryId) async {
    return safeCall<List<Sources>>(() async {
      var response = await apiClient.getSources(categoryId);
      return Success(response.sources ?? []);
    });
  }
}
