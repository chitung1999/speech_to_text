import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/ui/page/bg/bg.dart';
import 'package:speech_to_text/ui/route/route_name.dart';
import 'package:speech_to_text/ui/widget/text_button_app.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundPage(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,
            children: [
              const Text(
                'Setting',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButtonApp.outline(
                title: 'Logout',
                height: 50,
                width: double.infinity,
                borderColor: AppColors.border,
                borderWidth: 2,
                radius: 12,
                onPressed: () {
                  context.pop();
                  context.replaceNamed(RouteName.login);
                },
                textStyle: TextStyle(color: AppColors.text),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
