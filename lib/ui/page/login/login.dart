import 'package:flutter/material.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/ui/page/bg/bg.dart';
import 'package:speech_to_text/ui/page/login/widget/content_login.dart';
import 'package:speech_to_text/ui/page/login/widget/header_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.transparent,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderLogin(),
              Expanded(child: ContentLogin())
            ],
          ),
        )
      ),
    );
  }
}
