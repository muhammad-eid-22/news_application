import 'package:bounceable/bounceable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/extension/extension.context.dart';
import 'package:news_app/core/route/app_routes.dart';
import 'package:news_app/features/layout/bookmark/bookmark_view.dart';
import 'package:news_app/features/layout/category/category_view.dart';
import 'package:news_app/features/layout/home/view/home_page.dart';
import 'package:news_app/features/layout/widgets/custom_bottom_nav.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  int currentIndex = 0;

  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeView(),
      const CategoryView(),
      const BookmarkView(),
    ];
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          Bounceable(
            onTap: () => Navigator.pushNamed(context, AppRoutes.searchPage),
            child: Icon(Icons.search),
          ),
          SizedBox(width: context.wd(16)),
          Icon(Icons.notifications_none_rounded),
          SizedBox(width: context.wd(16)),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
      body: screens[currentIndex],
    );
  }
}
