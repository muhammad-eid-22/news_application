import 'package:flutter/material.dart';
import 'package:news_app/core/extension/extension.context.dart';
import 'package:news_app/core/models/news_response.dart';
import 'package:news_app/core/theme/app_colors.dart';

class ArticleInfoSection extends StatelessWidget {
  final Article article;
  final bool isDark;
  const ArticleInfoSection({
    super.key,
    required this.article,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.all(size.width * 0.03),
      child: Column(
        spacing: context.hg(8),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.wd(16),
              vertical: context.hg(4),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: isDark
                  ? AppColors.primaryColor
                  : AppColors.primaryColorLight,
              borderRadius: BorderRadius.circular(context.wd(20)),
            ),
            child: Text(
              "General",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: AppColors.white),
            ),
          ),
          SizedBox(height: context.hg(4)),
          // Title
          article.title == null || article.title!.isEmpty
              ? Text(
                  "No title",
                  style: Theme.of(context).textTheme.headlineSmall,
                )
              : Text(
                  article.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          // Author and date
          Row(
            spacing: context.wd(16),
            children: [
              Expanded(
                child: article.author == null || article.author!.isEmpty
                    ? Text(
                        "Unknown",
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppColors.white,
                        ),
                      )
                    : Text(
                        article.author!,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppColors.white,
                        ),
                      ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  article.publishedAt.toString().substring(0, 10),
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(color: AppColors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
