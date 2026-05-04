import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/extension/extension.context.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/cubit/theme_cubit.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.primaryColor
                    : AppColors.primaryColorLight,
                borderRadius: BorderRadius.only(),
              ),
              child: Text(
                'News App',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(8),
            child: Column(
              spacing: context.hg(10),
              children: [
                ListTile(
                  leading: Icon(
                    Icons.dark_mode,
                    size: 30,
                    color: isDark ? AppColors.white : AppColors.black,
                  ),
                  title: Text(
                    "Dark Mode",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  trailing: AnimatedToggleSwitch.dual(
                    current: isDark,
                    first: false,
                    second: true,
                    onChanged: (value) {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                    height: 25,
                    padding: EdgeInsets.all(0),
                    spacing: -4,
                    indicatorSize: const Size(25, 25),
                    style: ToggleStyle(
                      backgroundColor: isDark
                          ? AppColors.darkGrey
                          : AppColors.lightGrey,
                      borderColor: Colors.transparent,
                      indicatorColor: isDark
                          ? AppColors.primaryColor
                          : AppColors.primaryColorLight,
                      borderRadius: BorderRadius.circular(16),
                      indicatorBorderRadius: BorderRadius.circular(25),
                    ),
                    iconBuilder: (value) => Icon(
                      value ? Icons.dark_mode : Icons.light_mode,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.public,
                    size: 30,
                    color: isDark ? AppColors.white : AppColors.black,
                  ),
                  title: Text(
                    "Country",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text("United States"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: isDark ? AppColors.white : AppColors.black,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.language,
                    size: 30,

                    color: isDark ? AppColors.white : AppColors.black,
                  ),
                  title: Text(
                    "Language",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text("English"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: isDark ? AppColors.white : AppColors.black,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
