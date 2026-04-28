import 'package:flutter/material.dart';
import 'package:news_app/core/extension/extension.context.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/features/layout/category/news_category_screen.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final List<String> category = [
    "General",
    "Business",
    "Entertainment",
    "Health",
    "Science",
    "Sports",
    "Technology",
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: category.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.wd(16)),
            child: Text(
              "Discover",
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: context.hg(8)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.wd(16)),
            child: Text(
              "News From All Around The World",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: AppColors.darkGrey),
            ),
          ),
          SizedBox(height: context.hg(24)),
          TabBar(
            tabAlignment: TabAlignment.start,

            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.primaryColor,
            ),
            unselectedLabelColor: AppColors.darkGrey,
            indicatorSize: TabBarIndicatorSize.tab,
            padding: EdgeInsets.symmetric(horizontal: context.wd(16)),
            isScrollable: true,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.white,
            ),
            tabs: category.map((cat) => Tab(text: cat)).toList(),
          ),
          SizedBox(height: context.hg(24)),
          Expanded(
            child: TabBarView(
              children: category
                  .map((cat) => NewsCategoryScreen(category: cat))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
