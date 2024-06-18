part of '_index.dart';

class Routes {
  static const String homeRoute = "/";
}

class AppRouter {
  static Route registerRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return _build(screen: const Home());
      default:
        return _build(screen: const CupertinoActivityIndicator());
    }
  }

  static Route _build({required Widget screen}) {
    return CupertinoPageRoute(
      builder: (context) => screen,
    );
  }
}
