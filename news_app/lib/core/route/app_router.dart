import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/route/app_routes.dart';
import 'package:news_app/core/models/news_response.dart';
import 'package:news_app/features/layout/bookmark/bookmark_view.dart';
import 'package:news_app/features/layout/category/category_view.dart';
import 'package:news_app/features/layout/home/view/ArticleDetailView/article_detail_view.dart';
import 'package:news_app/features/layout/home/view/home_page.dart';
import 'package:news_app/features/layout/layout_view.dart';
import 'package:news_app/features/search/cubit/search_cubit.dart';
import 'package:news_app/features/search/view/search_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.layoutView:
        return MaterialPageRoute(builder: (_) => const LayoutView());
      case AppRoutes.homePage:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case AppRoutes.articleDetailPage:
        return MaterialPageRoute(
          builder: (_) =>
              ArticleDetailView(article: settings.arguments as Article),
        );
      case AppRoutes.searchPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SearchCubit(),
            child: const SearchPage(),
          ),
        );
      case AppRoutes.categoryView:
        return MaterialPageRoute(builder: (_) => const CategoryView());
      case AppRoutes.bookmarkView:
        return MaterialPageRoute(builder: (_) => const BookmarkView());
      default:
        return MaterialPageRoute(builder: (_) => const HomeView());
    }
  }
}
