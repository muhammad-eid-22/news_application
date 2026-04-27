import 'package:flutter/material.dart';
import 'package:news_app/core/route/app_routes.dart';
import 'package:news_app/features/home/model/top_headlines_response.dart';
import 'package:news_app/features/home/ArticleDetailView/article_detail_view.dart';
import 'package:news_app/features/home/home_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homePage:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case AppRoutes.articleDetailPage:
        return MaterialPageRoute(builder: (_) =>  ArticleDetailView(article: settings.arguments as Article));
      default:
        return MaterialPageRoute(builder: (_) => const HomeView());
    }
  }
}
