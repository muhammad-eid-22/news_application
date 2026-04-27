import 'dart:ui' show ImageFilter;

import 'package:bounceable/bounceable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/extension/extension.context.dart';
import 'package:news_app/core/utils/theme_manager/app_colors.dart';
import 'package:news_app/features/home/model/top_headlines_response.dart';
import 'package:news_app/features/home/ArticleDetailView/widgets/appbar_item_widget.dart';

class ArticleDetailView extends StatelessWidget {
  final Article article;
  const ArticleDetailView({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Image and gradient
          Image.network(
            article.urlToImage ?? "",
            fit: BoxFit.cover,
            width: double.infinity,
            height: size.height * 0.6,
          ),
          Container(
            width: double.infinity,
            height: size.height * 0.6,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black54],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Appbar
          Positioned(
            top: size.height * 0.05,
            left: context.wd(8),
            right: context.wd(8),
            child: Row(
              children: [
                AppbarItemWidget(
                  icon: Icons.arrow_back,
                  onTap: () => Navigator.pop(context),
                ),
                const Spacer(),
                AppbarItemWidget(icon: Icons.more_horiz, onTap: () {}),
                SizedBox(width: context.wd(8)),
                AppbarItemWidget(
                  icon: Icons.bookmark_add_outlined,
                  onTap: () {},
                ),
              ],
            ),
          ),
          // Upper part with title
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
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
                          color: AppColors.lightPrimary,
                          borderRadius: BorderRadius.circular(context.wd(20)),
                        ),
                        child: Text(
                          "General",
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(color: AppColors.white),
                        ),
                      ),
                      SizedBox(height: context.hg(4)),
                      // Title
                      Text(
                        article.title ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      // Author and date
                      Row(
                        spacing: context.wd(16),
                        children: [
                          Expanded(
                            child: Text(
                              article.author ?? "Unknown",
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(color: AppColors.white),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              article.publishedAt.toString().substring(0, 10),
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(color: AppColors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Lower part with content
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
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
                              backgroundImage: NetworkImage(
                                article.urlToImage ?? "",
                              ),
                            ),
                            Text(
                              article.source?.name ?? "",
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        Text(
                          article.content ?? "",
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
