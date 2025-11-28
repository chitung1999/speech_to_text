import 'package:flutter/material.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/core/constants/app_text_styles.dart';
class ItemSetting extends StatelessWidget {
  const ItemSetting({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.value
  });

  final IconData icon;
  final String title;
  final String? value;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      child: Row(
        spacing: 10,
        children: [
          Icon(
            icon,
            size: 22,
            color: AppColors.icon,
          ),
          Text(
            title,
            style: AppTextStyles.text_16
          ),
          Spacer(),
          if(value != null)
          Text(
            value!,
            style: AppTextStyles.text_16,
          ),
          Icon(
            Icons.navigate_next,
            size: 22,
            color: AppColors.icon,
          ),
        ],
      ),
    );
  }
}