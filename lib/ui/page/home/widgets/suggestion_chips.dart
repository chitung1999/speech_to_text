import 'package:flutter/material.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/core/constants/app_text_styles.dart';

class SuggestionChips extends StatelessWidget {
  const SuggestionChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(23, 0, 21, 0),
      child: Wrap(
        spacing: 10.0, // gap between adjacent chips
        runSpacing: 28.0, // gap between lines
        children: const <Widget>[
          _SuggestionChip(label: "Sing me a song"),
          _SuggestionChip(label: "Restaurants nearby"),
          _SuggestionChip(label: "Play a game"),
          _SuggestionChip(label: "Sports news"),
          _SuggestionChip(label: "Random fun"),
          _SuggestionChip(label: "Today’s Weather"),
          _SuggestionChip(label: "Play a game"),
          _SuggestionChip(label: "Sports news"),
          _SuggestionChip(label: "Random fun"),
          _SuggestionChip(label: "Today’s Weather"),
        ],
      ),
    );
  }
}

class _SuggestionChip extends StatelessWidget {
  final String label;

  const _SuggestionChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => debugPrint('Chip tapped: $label'),
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
}
