import 'package:flutter/material.dart';
import 'package:news_app/core/extension/extension.context.dart';
import 'package:news_app/features/layout/ArticleDetailView/widgets/appbar_widgets/appbar_item_widget.dart';

class ArticleAppbar extends StatelessWidget {
  const ArticleAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppbarItemWidget(
          icon: Icons.arrow_back,
          onTap: () => Navigator.pop(context),
        ),
        const Spacer(),
        AppbarItemWidget(icon: Icons.more_horiz, onTap: () {}),
        SizedBox(width: context.wd(8)),
        AppbarItemWidget(icon: Icons.bookmark_add_outlined, onTap: () {}),
      ],
    );
  }
}
