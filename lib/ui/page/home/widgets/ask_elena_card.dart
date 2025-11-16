import 'package:flutter/material.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/core/constants/app_text_styles.dart';

class AskElenaCard extends StatelessWidget {
  const AskElenaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hi Lan",
            style: AppTextStyles.heading,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.black38,
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ElenaButton(),
                SizedBox(width: 16),
                Expanded(child: _ElenaText()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ElenaButton extends StatelessWidget {
  const _ElenaButton();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => debugPrint('Pressed'),
      borderRadius: BorderRadius.circular(23),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.accent,
            width: 2,
          ),
        ),
        child: Container(
          width: 21,
          height: 21,
          decoration: const BoxDecoration(
            color: AppColors.accent,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _ElenaText extends StatelessWidget {
  const _ElenaText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Hi, I am Elena.\nWhat can I do for you today?",
      style: AppTextStyles.body,
    );
  }
}