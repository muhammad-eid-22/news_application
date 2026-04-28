import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/core/extension/extension.context.dart';
import 'package:news_app/core/theme/app_colors.dart';

class TitleHeader extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const TitleHeader({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.wd(16),
        vertical: context.hg(8),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          TextButton(
            onPressed: onTap,
            child: Text(
              "See All",
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
