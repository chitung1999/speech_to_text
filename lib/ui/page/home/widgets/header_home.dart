import 'package:flutter/material.dart';
import 'package:speech_to_text/core/constants/app_text_styles.dart';
import 'package:speech_to_text/ui/widget/avatar.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key, required this.fullName});
  final String fullName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'VoxHome',
              style: AppTextStyles.headerText_12_700,
            ),
            Text(
                "Hi $fullName",
                style: AppTextStyles.headerText_20_700
            ),
          ],
        ),
        Avatar(size: 40)
      ],
    );
  }
}