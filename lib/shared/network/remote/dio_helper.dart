import 'package:dio/dio.dart';

// baseUrl = 'https://newsapi.org/'
// method = 'v2/top-headlines'
// queries = 'country=eg&category=business&apiKey=973fb8bb839246adbd5e6401e0154226'

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio!.get(url, queryParameters: query);
  }
}
