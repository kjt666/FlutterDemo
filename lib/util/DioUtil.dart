import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class DioUtil {
  static var dio = Dio();

  static void init() {
    var baseUrl = "http://apidev.laidan.com:81/";
    var options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 10000,
        headers: {
          'X-YS-os': 'android',
          'X-YS-uid': '1',
          'X-YS-CHANNEL': 'youshu',
          'X-YS-soft': '5.30.0',
          // 'X-YS-USER-TOKEN': 'b9d81b74af3c6605d38ecf7cb1393d38'
          'X-YS-USER-TOKEN':'064688c93660d1bd5b71ed2b5152872a'
        },
        contentType: Headers.formUrlEncodedContentType,
        responseType: ResponseType.plain);
    dio.options = options;
    dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
  }
}
