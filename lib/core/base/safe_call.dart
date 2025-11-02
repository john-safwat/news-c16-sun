import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_c16_sun/core/base/app_exceptions.dart';
import 'package:news_c16_sun/core/base/results.dart';

Future<Results<T>> safeCall<T>(Future<Results<T>> Function() execute) async {
  try {
    var result = await execute();
    return result;
  } on DioException catch (e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.sendTimeout:
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.receiveTimeout:
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.badResponse:
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.cancel:
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.unknown:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  } on IOException {
    return Failure("No Internet Connection", NetworkException());
  } catch (e) {
    return Failure<T>(e.toString(), e as Exception);
  }
}
