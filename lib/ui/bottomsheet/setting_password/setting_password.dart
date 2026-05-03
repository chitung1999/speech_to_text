import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/core/constants/app_text_styles.dart';
import 'package:speech_to_text/ui/widget/text_button_app.dart';

class SettingPassword extends StatelessWidget {
  SettingPassword({super.key});

  final TextEditingController _oldPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _reNewPassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30).copyWith(bottom: 30 + MediaQuery.of(context).viewInsets.bottom,),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          Text(
            'change_password.title'.tr(),
            style: AppTextStyles.titleBottomSheet,
          ),
          SizedBox(),
          TextFormField(
            controller: _oldPassword,
            style: AppTextStyles.text_16,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'change_password.enter_old_password'.tr(),
              hintStyle: AppTextStyles.hintText,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          TextFormField(
            controller: _newPassword,
            style: AppTextStyles.text_16,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'change_password.enter_new_password'.tr(),
              hintStyle: AppTextStyles.hintText,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          TextFormField(
            controller: _reNewPassword,
            style: AppTextStyles.text_16,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'change_password.re_enter_password'.tr(),
              hintStyle: AppTextStyles.hintText,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          TextButtonApp.primary(
              title: 'change_password.continue'.tr(),
              height: 50,
              width: double.infinity,
              bgColor: AppColors.bgButton,
              radius: 10,
              onPressed: () {},
              textStyle: AppTextStyles.buttonPrimary
          ),
          SizedBox()
        ],
      ),
    );
  }
}