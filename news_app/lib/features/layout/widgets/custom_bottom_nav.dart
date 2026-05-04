import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/extension/extension.context.dart';
import 'package:news_app/core/gen/assets.gen.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/cubit/theme_cubit.dart';
import 'package:news_app/features/layout/widgets/nav_bar_item.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;
  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.wd(16),
        vertical: context.hg(30),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.center,
            height: 60,
            decoration: BoxDecoration(
              color: isDark ? Colors.white12 : Colors.black12,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white54, width: 1.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomBottomNavBaritem(
                  lable: "Home",
                  icon: currentIndex == 0
                      ? Assets.icons.homeActive.svg()
                      : Assets.icons.home.svg(
                          colorFilter: ColorFilter.mode(
                            AppColors.primaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                  onTap: () => onTap(0),
                  isSelected: currentIndex == 0,
                ),
                CustomBottomNavBaritem(
                  lable: "Category",
                  icon: currentIndex == 1
                      ? Assets.icons.categoryActive.svg()
                      : Assets.icons.category.svg(
                          colorFilter: ColorFilter.mode(
                            AppColors.primaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                  onTap: () => onTap(1),
                  isSelected: currentIndex == 1,
                ),
                CustomBottomNavBaritem(
                  lable: "Bookmark",
                  icon: currentIndex == 2
                      ? Assets.icons.bookmarkActive.svg()
                      : Assets.icons.bookmark.svg(
                          colorFilter: ColorFilter.mode(
                            AppColors.primaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                  onTap: () => onTap(2),
                  isSelected: currentIndex == 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
