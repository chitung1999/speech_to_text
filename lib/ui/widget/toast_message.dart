import 'package:flutter/material.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';

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
        iconColor = Colors.red;
        icon = Icons.error_outline;
        break;
      case NotificationType.warning:
        iconColor = Colors.yellow;
        icon = Icons.warning_amber;
        break;
      case NotificationType.success:
        iconColor = Colors.green;
        icon = Icons.check;
        break;
    }

    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned.fill(
        bottom: 20,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.black87,
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
                    style: TextStyle(color: AppColors.white),
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