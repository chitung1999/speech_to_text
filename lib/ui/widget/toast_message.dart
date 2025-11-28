import 'package:flutter/material.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/core/constants/app_text_styles.dart';

enum NotificationType {success, warning, error}

abstract class ToastMessage {
  static OverlayEntry? _currentOverlayEntry;

  static show(BuildContext context, NotificationType type, String msg) {
    _currentOverlayEntry?.remove();
    _currentOverlayEntry = null;

    Color iconColor;
    IconData icon;
    switch (type) {
      case NotificationType.error:
        iconColor = AppColors.error;
        icon = Icons.error_outline;
        break;
      case NotificationType.warning:
        iconColor = AppColors.warning;
        icon = Icons.warning_amber;
        break;
      case NotificationType.success:
        iconColor = AppColors.success;
        icon = Icons.check;
        break;
    }

    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned.fill(
        bottom: 40,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: AppColors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.bgToastMsg,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 8,
                children: [
                  Icon(
                    icon,
                    color: iconColor,
                  ),
                  Text(
                    msg,
                    style: AppTextStyles.headerText_14,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    _currentOverlayEntry = overlayEntry;
    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      if (_currentOverlayEntry == overlayEntry) {
        _currentOverlayEntry?.remove();
        _currentOverlayEntry = null;
      }
    });
  }
}