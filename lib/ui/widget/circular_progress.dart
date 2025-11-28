import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';

class CircularProgress {
  static Future<void> execute({
    required BuildContext context,
    required Future Function() function,
  }) async {
    _showOverlay(context);
    try {
      await function();
    } finally {
      if(context.mounted) {
        context.pop();
      }
    }
  }

  static void _showOverlay(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Center(
        child: CircularProgressIndicator(
          strokeWidth: 3,
          color: AppColors.white,
        ),
      ),
    );
  }
}
