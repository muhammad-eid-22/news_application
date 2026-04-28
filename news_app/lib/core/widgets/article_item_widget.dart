import 'package:bounceable/bounceable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/extension/extension.context.dart';
import 'package:news_app/core/models/news_response.dart';
import 'package:news_app/core/route/app_routes.dart';

class ArticleItemWidget extends StatelessWidget {
  final Article article;
  const ArticleItemWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.wd(16), vertical: 8),
      child: Bounceable(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.articleDetailPage,
            arguments: article,
          );
        },
        child: Row(
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(article.urlToImage ?? ""),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: context.wd(16)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: context.hg(8),
                children: [
                  Text(
                    article.source?.name ?? "",
                    style: TextStyle(
                      fontSize: context.hg(14),
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    article.title ?? "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: context.hg(16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    article.publishedAt != null
                        ? "${article.publishedAt!.toLocal()}".split(' ')[0]
                        : "",
                    style: TextStyle(
                      fontSize: context.hg(12),
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
