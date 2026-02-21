import 'package:dio/dio.dart';
import 'package:reels_simulation/Core/config/app_config.dart';

class DioConfigration {
  static Dio create() {
    final dio = Dio(BaseOptions(baseUrl: AppConfig.baseUrl));

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = AppConfig.apiKey;
          // options.headers['Authorization'] = 'Bearer ${'AppConfig.token'}';
          handler.next(options);
        },
      ),
    );
    return dio;
  }
}
