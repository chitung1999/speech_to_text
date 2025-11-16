import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.size, required this.isShowName});

  final double size;
  final bool isShowName;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        SvgPicture.asset(
          'assets/icon/avatar.svg',
          width: size,
          height: size,
        ),
        if (isShowName)
        Text(
          'Chi Lan',
          style: TextStyle(
            color: AppColors.text,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}