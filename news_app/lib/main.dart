import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/route/app_router.dart';
import 'package:news_app/core/route/app_routes.dart';
import 'package:news_app/core/api/AppConstants.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/core/theme/cubit/theme_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider(create: (context) => ThemeCubit(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstants.appName,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: AppRoutes.layoutView,
        );
      },
    );
  }
}
