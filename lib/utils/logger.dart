part of '_index.dart';

class Logger {
  static void log(
    String title,
    String name,
  ) {
    developer.log(
      title,
      name: name,
    );
  }

  static void errorLog(String title, String name, DioException error) {
    developer.log(
      title,
      name: name,
      error: jsonEncode(error.response?.data),
    );
  }
}
