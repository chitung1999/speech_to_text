import 'package:flutter/material.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
class ItemSetting extends StatelessWidget {
  const ItemSetting({
    super.key,
    required this.icon,
    required this.title,
    this.value
  });

  final IconData icon;
  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Icon(
          icon,
          size: 20,
          color: AppColors.iconLight,
        ),
        Text(
          title,
          style: TextStyle(
            color: AppColors.text,
            fontSize: 15,
          ),
        ),
        Spacer(),
        if(value != null)
        Text(
          value!,
          style: TextStyle(
            color: AppColors.text,
            fontSize: 15,
          ),
        ),
        Icon(
          Icons.navigate_next,
          size: 20,
          color: AppColors.iconLight,
        ),
      ],
    );
  }
}