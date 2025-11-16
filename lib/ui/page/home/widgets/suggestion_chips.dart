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
            color: AppColors.chipBorder,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 13),
        child: Text(
          label,
          style: AppTextStyles.chip,
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
          _suggestionChip("Sing me a song"),
          _suggestionChip("Restaurants nearby"),
          _suggestionChip("Play a game"),
          _suggestionChip("Sports news"),
          _suggestionChip("Random fun"),
          _suggestionChip("Today’s Weather"),
          _suggestionChip("Play a game"),
          _suggestionChip("Sports news"),
          _suggestionChip("Random fun"),
          _suggestionChip("Today’s Weather"),
        ],
      ),
    );
  }
}