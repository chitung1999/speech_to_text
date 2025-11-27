import 'package:flutter/material.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';

class AppTextStyles {
  static const TextStyle titlePage = TextStyle(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle titleBottomSheet = TextStyle(
    color: AppColors.text,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle body = TextStyle(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle chip = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 16,
  );

  static const TextStyle small = TextStyle(
    color: AppColors.text,
    fontSize: 14,
  );

  static const TextStyle medium = TextStyle(
    color: AppColors.text,
    fontSize: 16,
  );

  static const TextStyle hintText = TextStyle(
    color: AppColors.hintText,
    fontSize: 16
  );

  static const TextStyle buttonPrimary = TextStyle(
      color: AppColors.white,
      fontSize: 18
  );

  static const TextStyle highlightText = TextStyle(
      color: AppColors.highlightText,
      fontSize: 14
  );
}
