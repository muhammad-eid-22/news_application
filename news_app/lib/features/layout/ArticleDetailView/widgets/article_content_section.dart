import 'package:flutter/material.dart';
import 'package:news_app/core/extension/extension.context.dart';
import 'package:news_app/core/models/news_response.dart';
import 'package:news_app/core/theme/app_colors.dart';

class ArticleContentSection extends StatelessWidget {
  final Article article;
  final bool isDark;
  const ArticleContentSection({super.key, required this.article, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? AppColors.black : AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.wd(36)),
          topRight: Radius.circular(context.wd(36)),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(context.wd(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: context.wd(24),
          children: [
            Row(
              spacing: context.wd(8),
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(article.urlToImage ?? ""),
                ),
                Text(
                  article.source?.name ?? "",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: isDark ? AppColors.white : AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              article.description ?? "",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: isDark ? AppColors.white : AppColors.black,
                letterSpacing: 0.25,
                height: 1.5,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
