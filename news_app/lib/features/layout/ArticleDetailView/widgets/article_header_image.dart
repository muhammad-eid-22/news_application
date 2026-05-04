import 'package:flutter/material.dart';
import 'package:news_app/core/gen/assets.gen.dart';
import 'package:news_app/core/models/news_response.dart';

class ArticleHeaderImage extends StatelessWidget {
  final Article article;
  const ArticleHeaderImage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        article.urlToImage == null || article.urlToImage!.isEmpty
            ? Image.asset(
                Assets.images.elementorPlaceholderImage.path,
                fit: BoxFit.cover,
                width: double.infinity,
                height: size.height * 0.6,
              )
            : Image.network(
                article.urlToImage!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: size.height * 0.6,
              ),
        Container(
          width: double.infinity,
          height: size.height * 0.6,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black87],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}
