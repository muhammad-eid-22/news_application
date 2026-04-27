import 'package:bounceable/bounceable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/extension/extension.context.dart';
import 'package:news_app/features/home/model/top_headlines_response.dart';
import 'package:news_app/features/home/ArticleDetailView/article_detail_view.dart';

class RecommendedNewsListWidget extends StatelessWidget {
  final List<Article> articles;

  const RecommendedNewsListWidget({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: context.wd(16)),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return Bounceable(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleDetailView(article: article),
              ),
            );
          },
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
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
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: context.hg(16)),
    );
  }
}
