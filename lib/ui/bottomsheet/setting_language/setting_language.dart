import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';

class SettingLanguage extends StatelessWidget {
  const SettingLanguage({super.key, required this.currentLanguage, required this.onSelected});

  final String currentLanguage;
  final Function(String) onSelected;

  @override
  Widget build(BuildContext context) {
    Widget item (String title) {
      return InkWell(
        onTap: () {
          onSelected(title);
          context.pop();
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.textBottomSheet,
                fontSize: 18,
              ),
            ),
            if (title == currentLanguage)
              Icon(Icons.check, color: AppColors.textBottomSheet)
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          const Text(
            "Language",
            style: TextStyle(
              color: AppColors.textBottomSheet,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(),
          item('English'),
          item('Vietnamese'),
          SizedBox()
        ],
      ),
    );
  }
}
