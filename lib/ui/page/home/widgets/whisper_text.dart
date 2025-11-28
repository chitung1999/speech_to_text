import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/core/constants/app_text_styles.dart';

class WhisperText extends StatelessWidget {
  final String message;

  const WhisperText({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.6),
            blurRadius: 10,
            spreadRadius: 1,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            SvgPicture.asset(
              "assets/icon/listening_2.svg",
              fit: BoxFit.fill,
              height: 50,
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SingleChildScrollView(
                      child: Text(
                        message,
                        style: AppTextStyles.text_20,
                      )
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}