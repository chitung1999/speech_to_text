import 'package:flutter/material.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/ui/page/bg/bg.dart';
import 'package:speech_to_text/ui/widget/go_back.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: GoBack(
          title: 'Forgot Password',
          style: TextStyle(
            color: AppColors.text,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )
        ),
        body: Center(
          child: Text(
            'Please contact the administrator to retrieve your account.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.text,
              fontSize: 16,
            )
          ),
        )
      ),
    );
  }
}
