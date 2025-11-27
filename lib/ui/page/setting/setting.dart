import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/core/enums/language.dart';
import 'package:speech_to_text/domain/di/di.dart';
import 'package:speech_to_text/domain/repositories/local/shared_preference.dart';
import 'package:speech_to_text/presentation/generated/locales/locale_keys.g.dart';
import 'package:speech_to_text/ui/bottomsheet/setting_language/setting_language.dart';
import 'package:speech_to_text/ui/bottomsheet/setting_password/setting_password.dart';
import 'package:speech_to_text/ui/page/bg/bg.dart';
import 'package:speech_to_text/ui/page/setting/widget/item_setting.dart';
import 'package:speech_to_text/ui/route/route_name.dart';
import 'package:speech_to_text/ui/widget/avatar.dart';
import 'package:speech_to_text/ui/widget/go_back.dart';
import 'package:speech_to_text/ui/widget/text_button_app.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Language _currentLanguage = Language.en;

  String _getStrLanguage(Language lang) {
    switch (lang) {
      case Language.en:
        return LocaleKeys.setting_en.tr();
      case Language.vi:
        return LocaleKeys.setting_vn.tr();
    }
  }

  void _onSettingLanguage() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SettingLanguage(
          currentLanguage: _currentLanguage,
          onSelected: (value) {
            setState(() {_currentLanguage = value;});
          }
        );
      }
    );
  }

  void _onSettingPassword() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SettingPassword();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: GoBack(
          title: 'Setting',
          style: TextStyle(
            color: AppColors.text,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 30,
          children: [
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
                    ItemSetting(
                      icon: Icons.language,
                      title: LocaleKeys.setting_language.tr(),
                      value: _getStrLanguage(_currentLanguage),
                      onTap: _onSettingLanguage
                    ),
                    ItemSetting(icon: Icons.lock_open, title: 'Password', onTap: _onSettingPassword),
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
                final prefs = getIt<SharedPreferencesApp>();
                prefs.setToken('');
              },
              textStyle: TextStyle(color: AppColors.text),
            ),
            SizedBox()
          ]
        ),
      ),
    );
  }
}
