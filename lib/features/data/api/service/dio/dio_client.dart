import 'package:dio/dio.dart';

Dio buildDioClient({required String base}) {
    final dio  = Dio()..options = BaseOptions(baseUrl: base);

    return dio;
}