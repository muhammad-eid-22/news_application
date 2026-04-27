import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/core/extension/extension.context.dart';

class TitleHeader extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const TitleHeader({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.hg(8)),
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
              ).textTheme.titleSmall?.copyWith(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
