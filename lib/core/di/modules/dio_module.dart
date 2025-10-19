
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule{

  @lazySingleton
  Dio buildDioObject() {
    Dio dio = Dio();

    dio.options = BaseOptions(
      baseUrl: "https://newsapi.org",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {"Authorization": "2c58c6392813448996cbedf8b2cd9b2e"},
    );

    dio.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );

    return dio;
  }

}