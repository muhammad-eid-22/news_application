import 'package:bounceable/bounceable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/extension/extension.context.dart';
import 'package:news_app/core/route/app_router.dart';
import 'package:news_app/core/route/app_routes.dart';
import 'package:news_app/features/layout/home/cubit/home_cubit.dart';
import 'package:news_app/features/layout/home/view/widgets/custom_slider.dart';
import 'package:news_app/core/widgets/article_item_widget.dart';
import 'package:news_app/features/layout/home/view/widgets/title_header.dart';
import 'package:news_app/features/search/view/search_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final homeCubit = HomeCubit();
        homeCubit.getBreakingNews();
        homeCubit.getRecommendedNews();
        return homeCubit;
      },
      child: Scaffold(
        body: Builder(
          builder: (context) {
            final homeCubit = BlocProvider.of<HomeCubit>(context);
            return SingleChildScrollView(
              child: Column(
                children: [
                  TitleHeader(title: "Breaking News", onTap: () {}),
                  SizedBox(height: context.hg(12)),
                  BlocBuilder<HomeCubit, HomeState>(
                    bloc: homeCubit,
                    buildWhen: (previous, current) =>
                        current is TopHeadlinesLoaded ||
                        current is TopHeadlinesError ||
                        current is TopHeadlinesLoading,
                    builder: (context, state) {
                      if (state is TopHeadlinesLoaded) {
                        final articles = state.articlesResponse;
                        return CustomSlider(article: articles!);
                      }
                      if (state is TopHeadlinesError) {
                        return Text("Error: ${state.message}");
                      }
                      if (state is TopHeadlinesLoading) {
                        return const CircularProgressIndicator();
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  SizedBox(height: context.hg(24)),
                  TitleHeader(title: "Recommended News", onTap: () {}),
                  BlocBuilder<HomeCubit, HomeState>(
                    bloc: homeCubit,
                    buildWhen: (previous, current) =>
                        current is RecommendedNewsLoaded ||
                        current is RecommendedNewsError ||
                        current is RecommendedNewsLoading,
                    builder: (context, state) {
                      if (state is RecommendedNewsLoading) {
                        return const CircularProgressIndicator();
                      }
                      if (state is RecommendedNewsLoaded) {
                        final article = state.articlesResponse;
                        return ListView.builder(
                          itemCount: article!.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ArticleItemWidget(article: article![index]);
                          },
                        );
                      }
                      if (state is RecommendedNewsError) {
                        return Text("Error: ${state.message}");
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
