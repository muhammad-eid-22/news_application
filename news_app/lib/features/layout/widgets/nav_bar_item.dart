import 'package:bounceable/bounceable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/extension/extension.context.dart';
import 'package:news_app/core/theme/app_colors.dart';

class CustomBottomNavBaritem extends StatelessWidget {
  final String lable;
  final Widget icon;
  final void Function() onTap;
  final bool isSelected;
  const CustomBottomNavBaritem({
    super.key,
    required this.lable,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
        ),
        child: Row(
          spacing: context.wd(10),
          children: [
            icon,
            isSelected
                ? AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      lable,
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall?.copyWith(color: Colors.white),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
