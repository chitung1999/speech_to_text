import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/ui/page/bg/bg.dart';
import 'package:speech_to_text/ui/page/setting/widget/item_setting.dart';
import 'package:speech_to_text/ui/route/route_name.dart';
import 'package:speech_to_text/ui/widget/avatar.dart';
import 'package:speech_to_text/ui/widget/goback.dart';
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
          padding: const EdgeInsets.only(top: 30, bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,
            children: [
              Goback(
                title: 'Setting',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(child: Avatar(size: 70, isShowName: true)),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black38,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 20,
                    children: [
                      ItemSetting(icon: Icons.language, title: 'Language', value: 'English'),
                      ItemSetting(icon: Icons.lock_open, title: 'Password'),
                    ],
                  ),
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
