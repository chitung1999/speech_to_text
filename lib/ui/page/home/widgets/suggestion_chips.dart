import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/core/constants/app_text_styles.dart';

class SuggestionChips extends StatelessWidget {
  const SuggestionChips({super.key, required this.onTap});
  final Function(String) onTap;

  Widget _suggestionChip (String label) {
    return GestureDetector(
      onTap: () => onTap(label),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.border,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 13),
        child: Text(
          label,
          style: AppTextStyles.text_14,
        ),
      ),
    );
}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: [
          _suggestionChip('suggestions.sing_song'.tr()),
          _suggestionChip('suggestions.restaurants'.tr()),
          _suggestionChip('suggestions.play_game'.tr()),
          _suggestionChip('suggestions.sports_news'.tr()),
          _suggestionChip('suggestions.random_fun'.tr()),
          _suggestionChip('suggestions.weather'.tr()),
        ],
      ),
    );
  }
}