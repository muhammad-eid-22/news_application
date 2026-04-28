import 'package:flutter/material.dart';
import 'package:news_app/core/route/app_router.dart';
import 'package:news_app/core/route/app_routes.dart';
import 'package:news_app/core/api/AppConstants.dart';
import 'package:news_app/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRoutes.layoutView,
    );
  }
}
