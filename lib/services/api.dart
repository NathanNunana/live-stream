part of '_index.dart';

class APIService {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  Dio get dio => _dio;

  static void interceptException() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, ErrorInterceptorHandler handler) {
          if (error.response?.statusCode == 401) {
            Logger.errorLog("Unauthorized", "", error);
          }
          handler.next(error);
        },
      ),
    );
  }
}
