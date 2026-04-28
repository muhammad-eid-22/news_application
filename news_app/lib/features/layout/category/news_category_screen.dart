import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/widgets/article_item_widget.dart';
import 'package:news_app/core/cubit/news_cubit.dart';

class NewsCategoryScreen extends StatelessWidget {
  final String category;
  const NewsCategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final homeCubit = NewsCubit();
        homeCubit.getNewsByCategory(category, 20);
        return homeCubit;
      },
      child: Expanded(
        child: BlocBuilder<NewsCubit, NewsState>(
          buildWhen: (previous, current) =>
              current is TopHeadlinesLoaded ||
              current is TopHeadlinesError ||
              current is TopHeadlinesLoading,
          builder: (context, state) {
            if (state is TopHeadlinesLoaded) {
              final articles = state.articlesResponse;
              return ListView.builder(
                itemCount: articles!.length,
                itemBuilder: (context, index) =>
                    ArticleItemWidget(article: articles[index]),
              );
            }
            if (state is TopHeadlinesError) {
              return Text("Error: ${state.message}");
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
