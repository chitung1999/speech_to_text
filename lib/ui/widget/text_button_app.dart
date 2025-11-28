import 'package:flutter/material.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';

enum TextButtonType { normal, outline, primary }

class TextButtonApp extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isEnabled;
  final double? width;
  final double? height;
  final double? radius;
  final TextButtonType type;
  final TextStyle? textStyle;
  final Color? bgColor;
  final Color? borderColor;
  final double? borderWidth;

  const TextButtonApp._({
    required this.title,
    required this.onPressed,
    required this.type,
    this.isEnabled = true,
    this.width,
    this.height,
    this.radius,
    this.textStyle,
    this.bgColor,
    this.borderColor,
    this.borderWidth,
  });

  factory TextButtonApp.normal({
    required String title,
    required VoidCallback onPressed,
    bool isEnabled = true,
    double? width,
    double? height,
    TextButtonType? type,
    TextStyle? textStyle,
  }) {
    return TextButtonApp._(
      title: title,
      onPressed: onPressed,
      isEnabled: isEnabled,
      width: width,
      height: height,
      textStyle: textStyle,
      type: TextButtonType.normal,
    );
  }

  factory TextButtonApp.primary({
    required String title,
    required VoidCallback onPressed,
    bool isEnabled = true,
    double? width,
    double? height,
    double? radius,
    TextStyle? textStyle,
    Color? bgColor,
  }) {
    return TextButtonApp._(
      title: title,
      onPressed: onPressed,
      type: TextButtonType.primary,
      isEnabled: isEnabled,
      width: width,
      height: height,
      radius: radius,
      bgColor: bgColor,
      textStyle: textStyle,
    );
  }

  factory TextButtonApp.outline({
    required String title,
    required VoidCallback onPressed,
    bool isEnabled = true,
    double? width,
    double? height,
    double? radius,
    TextStyle? textStyle,
    Color? borderColor,
    double? borderWidth,
  }) {
    return TextButtonApp._(
      title: title,
      onPressed: onPressed,
      type: TextButtonType.outline,
      isEnabled: isEnabled,
      width: width,
      height: height,
      radius: radius,
      textStyle: textStyle,
      borderColor: borderColor,
      borderWidth: borderWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (type == TextButtonType.normal) {
      Text content = Text(title, style: textStyle);

      return GestureDetector(
        onTap: isEnabled ? onPressed : null,
        child: width == null ? content :
        Container(
          width: width,
          height: height,
          color: AppColors.transparent,
          child: Center(child: content),
        ),
      );
    } else {
      final ButtonStyle style = TextButton.styleFrom(
        backgroundColor: bgColor ?? AppColors.transparent,
        minimumSize: Size(width ?? 0, height ?? 0),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 0),
          side: type == TextButtonType.outline
              ? BorderSide(color: borderColor ?? Colors.black, width: borderWidth ?? 1)
              : BorderSide.none,
        ),
        overlayColor: isEnabled ? null : AppColors.transparent,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );

      return TextButton(
        onPressed: isEnabled ? onPressed : null,
        style: style,
        child: Text(title, style: textStyle),
      );
    }
  }
}