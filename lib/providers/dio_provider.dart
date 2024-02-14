import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dio = Provider((ref) {
  final prettyLogger = PrettyDioLogger(requestHeader: true, responseBody: true, responseHeader: false, error: true);
  final interceptors = <Interceptor>[if (kDebugMode) prettyLogger];
  return Dio(
    BaseOptions(
      baseUrl: 'https://fashionbiz.org/api/',
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {
        'Accept': 'application/json',
      },
    ),
  )..interceptors.addAll(interceptors);
});
