import 'package:flutter/material.dart';
import 'package:speech_to_text/core/constants/app_text_styles.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'VoxHome',
              style: AppTextStyles.headerText_14_700,
            ),
            SizedBox(height: 10),
            Text(
              'Welcome',
              style: AppTextStyles.headerText_24_700
            ),
            Text(
              'Login to manage your home with your voice!',
              style: AppTextStyles.headerText_14,
            ),
          ],
        ),
      )
    );
  }
}