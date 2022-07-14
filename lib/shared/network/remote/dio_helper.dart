import 'package:dio/dio.dart';

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
    required String country,
    required String category,
  }) async {
    Map<String, String> query = {
      'country': country,
      'category': category,
      'apiKey': '973fb8bb839246adbd5e6401e0154226',
    };
    return await dio!.get('v2/top-headlines', queryParameters: query);
  }
}
