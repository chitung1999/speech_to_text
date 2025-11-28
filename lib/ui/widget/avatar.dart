import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/core/constants/app_text_styles.dart';
class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.size, this.fullName});

  final double size;
  final String? fullName;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icon/avatar.svg',
          width: size,
          height: size,
        ),
        if (fullName != null)
        Text(
          fullName!,
          style: AppTextStyles.text_16_700
        )
      ],
    );
  }
}