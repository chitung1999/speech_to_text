import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/core/enums/language.dart';
import 'package:speech_to_text/presentation/generated/locales/locale_keys.g.dart';

class SettingLanguage extends StatelessWidget {
  const SettingLanguage({super.key, required this.currentLanguage, required this.onSelected});

  final Language currentLanguage;
  final Function(Language) onSelected;

  @override
  Widget build(BuildContext context) {
    String getStrLanguage(Language lang) {
      switch (lang) {
        case Language.en:
          return LocaleKeys.setting_en.tr();
        case Language.vi:
          return LocaleKeys.setting_vn.tr();
      }
    }

    Widget item (Language lang) {
      return InkWell(
        onTap: () {
          onSelected(lang);
          context.setLocale(Locale(lang == Language.en ? 'en' : 'vi'));
          context.pop();
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              getStrLanguage(lang),
              style: TextStyle(
                color: AppColors.textBottomSheet,
                fontSize: 18,
              ),
            ),
            if (lang == currentLanguage)
              Icon(Icons.check, color: AppColors.textBottomSheet)
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          const Text(
            "Language",
            style: TextStyle(
              color: AppColors.textBottomSheet,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(),
          item(Language.en),
          item(Language.vi),
          SizedBox()
        ],
      ),
    );
  }
}
