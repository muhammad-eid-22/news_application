import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/extension/extension.context.dart';
import 'package:news_app/features/cubit/news_cubit.dart';
import 'package:news_app/features/presentation/pages/widgets/news_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return NewsCubit()..getSources();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          actions: [
            Icon(Icons.search),
            SizedBox(width: context.wd(16)),
            Icon(Icons.notifications_none_rounded),
            SizedBox(width: context.wd(16)),
          ],
        ),
        body: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is NewsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NewsSuccess) {
              final article = state.data.articles;
              if (article.isEmpty) {
                return const Center(child: Text("No Articles"));
              }
              return Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: context.hg(16),
                  children: [
                    Text(
                      "Breaking News",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 16 / 11,
                        enlargeFactor: 0.2,
                        viewportFraction: 0.94,
                        clipBehavior: Clip.none,
                      ),
                      items: List.generate(
                        article.length,
                        (index) => NewsCard(article: article, index: index),
                      ),
                    ),
                    Text(
                      "Recommendation",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is NewsError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
