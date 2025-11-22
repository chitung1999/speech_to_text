import 'package:flutter/material.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
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
        color: Colors.white38,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          const Text(
            "Change Password",
            style: TextStyle(
              color: AppColors.textBottomSheet,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(),
          TextFormField(
            controller: _oldPassword,
            style: TextStyle(color: AppColors.textBottomSheet),
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Enter old password',
              hintStyle: TextStyle(color: AppColors.textSecondary.withValues(alpha: 0.7)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.border)
              ),
            ),
          ),
          TextFormField(
            controller: _newPassword,
            style: TextStyle(color: AppColors.textBottomSheet),
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Enter new password',
              hintStyle: TextStyle(color: AppColors.textSecondary.withValues(alpha: 0.7)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.border)
              ),
            ),
          ),
          TextFormField(
            controller: _reNewPassword,
            style: TextStyle(color: AppColors.textBottomSheet),
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Re-enter new password',
              hintStyle: TextStyle(color: AppColors.textSecondary.withValues(alpha: 0.7)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.border)
              ),
            ),
          ),
          TextButtonApp.outline(
            title: 'Continue',
            height: 50,
            width: double.infinity,
            borderColor: AppColors.border,
            borderWidth: 2,
            radius: 12,
            onPressed: () {},
            textStyle: TextStyle(color: AppColors.textBottomSheet),
          ),
          SizedBox()
        ],
      ),
    );
  }
}