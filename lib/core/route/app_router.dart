import 'package:flutter/material.dart';
import 'package:news_app/core/route/app_routes.dart';
import 'package:news_app/features/presentation/pages/home_view.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homePage:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute(builder: (_) => const HomeView());
    }
  }
}
