import 'package:flutter/material.dart';
import 'package:speech_to_text/core/constants/app_text_styles.dart';

class CommandNotification extends StatelessWidget {
  const CommandNotification({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5,
        children: [
          Image.asset(
            'assets/image/done.png',
            width: 32,
            height: 32,
            fit: BoxFit.contain,
          ),
          Text(
            "Success",
            style: AppTextStyles.text_16_700,
          ),
        ],
      ),
      content: Text(
        text,
        style: AppTextStyles.text_20_700,
        textAlign: TextAlign.center,
      ),
    );
  }
}