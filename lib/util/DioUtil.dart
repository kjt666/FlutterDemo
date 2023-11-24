import 'package:dio/dio.dart';
// import 'package:dio_http_cache/dio_http_cache.dart';

class DioUtil {
  static var dio = Dio();

  static void init() {
    var baseUrl = "https://gongdu.laidan.com/";
    var options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
        headers: {
          'x-ys-os': 'android',
          'x-ys-uid': '90006269',
          'x-ys-CHANNEL': 'youshu',
          'x-ys-soft': '6.1.13',
          'X-YS-device-id': '03554a2d-e907-4838-8645-5cde6cb3d154',
          'x-ys-user-token':'V28_MTY0NTA2NTM1OGNlMWIwYjNkNjc3NDY2YWJiY2UyYmVlMjJjYjZkMGQ2NzQ5ODVmYTI='
        },
        contentType: Headers.formUrlEncodedContentType,
        responseType: ResponseType.plain);
    dio.options = options;
    // dio.interceptors
    //     .add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
  }
}
