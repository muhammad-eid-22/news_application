import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/extension/extension.context.dart';
import 'package:news_app/core/models/news_response.dart';
import 'package:news_app/core/route/app_routes.dart';
import 'package:news_app/core/theme/cubit/theme_cubit.dart';
import 'package:news_app/features/layout/ArticleDetailView/widgets/appbar_widgets/article_appbar.dart';
import 'package:news_app/features/layout/ArticleDetailView/widgets/article_content_section.dart';
import 'package:news_app/features/layout/ArticleDetailView/widgets/article_header_image.dart';
import 'package:news_app/features/layout/ArticleDetailView/widgets/article_info_section.dart';
import 'package:news_app/features/layout/ArticleDetailView/widgets/custom_elevated_button.dart';

class ArticleDetailView extends StatelessWidget {
  final Article article;
  const ArticleDetailView({super.key, required this.article});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.wd(16),
          vertical: context.hg(30.0),
        ),
        child: CustomElevatedButton(
          text: "View all",
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.webView,
              arguments: article.url,
            );
          },
        ),
      ),
      body: Stack(
        children: [
          // Image and gradient
          ArticleHeaderImage(article: article),
          // Appbar
          Positioned(
            top: size.height * 0.05,
            left: context.wd(8),
            right: context.wd(8),
            child: ArticleAppbar(),
          ),
          // Title & Content
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.3),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Upper part with title Info
                  ArticleInfoSection(article: article, isDark: isDark),
                  // Lower part with content
                  ArticleContentSection(article: article, isDark: isDark),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
