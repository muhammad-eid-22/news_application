import 'package:bounceable/bounceable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/extension/extension.context.dart';
import 'package:news_app/features/models/source_response_model.dart';

class NewsCard extends StatelessWidget {
  final List<Article> article;
  final int index;

  const NewsCard({super.key, required this.article, required this.index});

  @override
  Widget build(BuildContext context) {
    final item = article[index];

    return ClipRRect(
      borderRadius: BorderRadius.circular(context.wd(36)),
      child: Bounceable(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(item.urlToImage ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black12, Colors.black54],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Positioned(
                bottom: context.hg(24),
                left: context.wd(24),
                right: context.wd(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          item.source?.name ?? "",
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(color: Colors.white),
                        ),
                        SizedBox(width: context.wd(12)),
                        Text(
                          item.publishedAt.toString().substring(0, 10),
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: context.hg(6)),
                    Text(
                      item.title ,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontSize: context.wd(18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
