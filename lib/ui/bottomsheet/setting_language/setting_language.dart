import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/core/constants/app_text_styles.dart';
import 'package:speech_to_text/core/enums/language.dart';
import 'package:speech_to_text/domain/di/di.dart';
import 'package:speech_to_text/domain/repositories/local/shared_preference.dart';
import 'package:speech_to_text/ui/generated/locales/locale_keys.g.dart';

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

    Widget item (Language language) {
      return InkWell(
        onTap: () {
          onSelected(language);
          String strLanguage = language == Language.en ? 'en' : 'vi';
          context.setLocale(Locale(strLanguage));

          final prefs = getIt<SharedPreferencesApp>();
          prefs.setLanguage(strLanguage);

          context.pop();
        },
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              getStrLanguage(language),
              style: AppTextStyles.text_18,
            ),
            if (language == currentLanguage)
              Icon(Icons.check, color: AppColors.icon)
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          const Text(
            "Language",
            style: AppTextStyles.titleBottomSheet,
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
