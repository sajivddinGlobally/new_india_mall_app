import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio createDio() {
  final dio = Dio();
    
     dio.options.headers = {
    'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2luZGlhbWFsbC5saXZlIiwiaWF0IjoxNzQ5NDk3NTc4LCJuYmYiOjE3NDk0OTc1NzgsImV4cCI6MTc1MDEwMjM3OCwiZGF0YSI6eyJ1c2VyIjp7ImlkIjoiNzc3In19fQ.E9ut-tZbAkxBVrbzUjIFAJFdC5DbX6bsJQg54OkkIXs',
    'Content-Type': 'application/json',
  };

  dio.interceptors.add(
    PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ),
  );
  return dio;
}
