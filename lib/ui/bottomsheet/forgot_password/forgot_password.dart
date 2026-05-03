import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/core/constants/app_text_styles.dart';
import 'package:speech_to_text/core/extensions/string_extension.dart';
import 'package:speech_to_text/ui/widget/text_button_app.dart';
import 'package:speech_to_text/ui/widget/toast_message.dart';

enum Step {email, otp, password}

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  Step _step = Step.email;

  Widget _content() {
    late String hintText;
    switch (_step) {
      case Step.email:
        hintText = 'forgot_password.enter_email'.tr();
        break;
      case Step.otp:
        hintText = 'forgot_password.enter_otp'.tr();
        break;
      case Step.password:
        hintText = 'forgot_password.enter_new_password'.tr();
        break;
    }

    return Column(
      spacing: 20,
      children: [
        TextFormField(
          controller: _firstController,
          style: AppTextStyles.text_16,
          obscureText: _step == Step.password,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        if (_step == Step.password)
        TextFormField(
          controller: _secondController,
          style: AppTextStyles.text_16,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'forgot_password.re_enter_password'.tr(),
            hintStyle: AppTextStyles.hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }

  void _onContinue() {
    FocusScope.of(context).unfocus();

    switch (_step) {
      case Step.email:
        if(_firstController.text.isValidEmail) {
          _firstController.text = '';
          setState(() {_step = Step.otp;});
        } else {
          ToastMessage.show(context, NotificationType.error, 'forgot_password.invalid_email'.tr());
        }
        break;
      case Step.otp:
        if(_firstController.text.isValidOtp) {
          setState(() {_step = Step.password;});
        } else {
          ToastMessage.show(context, NotificationType.error, 'forgot_password.invalid_otp'.tr());
        }
        _firstController.text = '';
        break;
      case Step.password:
        break;
    }
  }

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
            'forgot_password.title'.tr(),
            style: AppTextStyles.titleBottomSheet,
          ),
          SizedBox(),
          _content(),
          TextButtonApp.primary(
              title: 'forgot_password.continue'.tr(),
              height: 50,
              width: double.infinity,
              bgColor: AppColors.bgButton,
              radius: 10,
              onPressed: _onContinue,
              textStyle: AppTextStyles.buttonPrimary
          ),
          SizedBox()
        ],
      ),
    );
  }
}
