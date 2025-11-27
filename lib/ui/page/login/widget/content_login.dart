import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/core/constants/app_text_styles.dart';
import 'package:speech_to_text/core/enums/status.dart';
import 'package:speech_to_text/domain/di/di.dart';
import 'package:speech_to_text/domain/models/login/login_response.dart';
import 'package:speech_to_text/domain/models/result/result.dart';
import 'package:speech_to_text/domain/repositories/local/shared_preference.dart';
import 'package:speech_to_text/domain/repositories/remote/remote_data.dart';
import 'package:speech_to_text/ui/bottomsheet/forgot_password/forgot_password.dart';
import 'package:speech_to_text/ui/route/route_name.dart';
import 'package:speech_to_text/ui/widget/circular_progress.dart';
import 'package:speech_to_text/ui/widget/text_button_app.dart';
import 'package:speech_to_text/ui/widget/toast_message.dart';

class ContentLogin extends StatelessWidget {
  const ContentLogin({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();


    Future<void> onLogin() async {
      if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
        ToastMessage.show(context, NotificationType.error, 'Invalid username or password');
        return;
      }

      final remoteData = getIt<RemoteData>();
      final Result<LoginResponse> result = await remoteData.onLogin(usernameController.text, passwordController.text);

      if(result.status == Status.success) {
        final prefs = getIt<SharedPreferencesApp>();
        await prefs.setToken(result.data!.token);

        await prefs.setFullName(result.data!.name);

        updateToken(result.data!.token);

        if (context.mounted) {
          context.replaceNamed(RouteName.home, queryParameters: {'fullName': result.data!.name});
        }
      }
    }

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            spacing: 30,
            children: [
              TextFormField(
                style: AppTextStyles.medium,
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'User name',
                  hintStyle: AppTextStyles.hintText,
                  prefixIcon: const Icon(Icons.person_outline, color: AppColors.hintText),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              TextFormField(
                style: AppTextStyles.medium,
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: AppTextStyles.hintText,
                  prefixIcon: const Icon(Icons.lock_open, color: AppColors.hintText),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentGeometry.centerRight,
                child: TextButtonApp.normal(
                  title: 'Forgot password?',
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return ForgotPassword();
                    }
                  ),
                  textStyle: AppTextStyles.highlightText
                ),
              ),
              TextButtonApp.primary(
                title: 'Login',
                height: 50,
                width: double.infinity,
                bgColor: AppColors.bgButton,
                radius: 10,
                onPressed: () => CircularProgress.execute(context: context, function: onLogin),
                textStyle: AppTextStyles.buttonPrimary
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    "Don't Have An Account?",
                    style: AppTextStyles.small
                  ),
                  TextButtonApp.normal(
                    title: 'Sign Up',
                    onPressed: () => context.pushNamed(RouteName.signUp),
                    textStyle: AppTextStyles.highlightText
                  )
                ],
              ),
            ],
          )
        )
      ),
    );
  }
}