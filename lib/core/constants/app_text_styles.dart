import 'package:flutter/material.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    color: AppColors.text,
    fontSize: 20,
  );

  static const TextStyle body = TextStyle(
    color: AppColors.text,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle chip = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 16,
  );
}
