import 'dart:ui';

import 'package:bounceable/bounceable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/extension/extension.context.dart';

class AppbarItemWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;

  const AppbarItemWidget({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.wd(32),
      height: context.wd(32),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Bounceable(
            onTap: onTap,
            child: Icon(icon, color: Colors.white, size: 24),
          ),
        ),
      ),
    );
  }
}
