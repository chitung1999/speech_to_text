import 'package:flutter/material.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/ui/page/bg/bg.dart';
import 'package:speech_to_text/ui/widget/go_back.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: GoBack(
          title: 'Sign up'
        ),
        body: Center(
          child: Text(
            'Please contact the administrator to register an account.',
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
