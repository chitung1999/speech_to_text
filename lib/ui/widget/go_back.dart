import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/core/constants/app_text_styles.dart';

class GoBack extends StatelessWidget implements PreferredSizeWidget {
  const GoBack({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        spacing: 10,
        children: [
          SizedBox(width: 10),
          GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: AppColors.white,
            ),
            onTap: () => context.pop()
          ),
          Text(title, style: AppTextStyles.headerText_20_700),
        ],
      ),
      backgroundColor: AppColors.transparent,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}