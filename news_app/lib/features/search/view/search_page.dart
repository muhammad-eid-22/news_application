import 'dart:math';

import 'package:bounceable/bounceable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/extension/extension.context.dart';
import 'package:news_app/core/widgets/article_item_widget.dart';
import 'package:news_app/features/search/cubit/search_cubit.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<SearchCubit>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.wd(16),
                  vertical: (context.wd(8)),
                ),
                child: TextFormField(
                  controller: controller,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter keyword';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Search news",
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: BlocBuilder<SearchCubit, SearchState>(
                      bloc: searchCubit,
                      builder: (context, state) {
                        if (state is SearchLoading) {
                          return TextButton(
                            onPressed: null,
                            child: Text("Search"),
                          );
                        }
                        return TextButton(
                          child: Text(
                            "Search",
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(color: Colors.blue),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await searchCubit.search(controller.text);
                            }
                          },
                        );
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.hg(16)),
              BlocBuilder<SearchCubit, SearchState>(
                bloc: searchCubit,
                buildWhen: (previous, current) =>
                    current is SearchLoaded ||
                    current is SearchError ||
                    current is SearchLoading,
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const CircularProgressIndicator.adaptive();
                  } else if (state is SearchLoaded) {
                    final articles = state.articles;
                    if (articles.isEmpty) {
                      return const Text("No Articles Found");
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: articles.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final article = articles[index];
                        return ArticleItemWidget(article: article);
                      },
                    );
                  } else if (state is SearchError) {
                    return Text("Error: ${state.message}");
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
