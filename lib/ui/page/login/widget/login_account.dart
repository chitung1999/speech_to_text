import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/domain/di/di.dart';
import 'package:speech_to_text/domain/repositories/local/shared_preference.dart';
import 'package:speech_to_text/ui/bottomsheet/forgot_password/forgot_password.dart';
import 'package:speech_to_text/ui/route/route_name.dart';
import 'package:speech_to_text/ui/widget/circular_progress.dart';
import 'package:speech_to_text/ui/widget/text_button_app.dart';
import 'package:speech_to_text/ui/widget/toast_message.dart';

class LoginAccount extends StatelessWidget {
  const LoginAccount({super.key, required this.onChangedLoginType});

  final Function onChangedLoginType;

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();


    Future<void> onLogin() async {
      if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
        ToastMessage.show(context, NotificationType.error, 'Invalid username or password');
        return;
      }

      await Future.delayed(const Duration(seconds: 1));
      if(context.mounted) {
        final prefs = getIt<SharedPreferencesApp>();
        prefs.setLoginStatus(true);
        context.replaceNamed(RouteName.home);
      }
    }

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 30,
        children: [
          const Text(
            'Welcome Back!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Enter your username and password to log in.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16,
            ),
          ),
          TextFormField(
            style: TextStyle(color: AppColors.text),
            controller: usernameController,
            decoration: InputDecoration(
              hintText: 'User name',
              filled: true,
              fillColor: Colors.black38,
              hintStyle: TextStyle(color: AppColors.textSecondary.withValues(alpha: 0.7)),
              prefixIcon: const Icon(Icons.person_outline, color: AppColors.textSecondary),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none
              ),
            ),
          ),
          TextFormField(
            style: const TextStyle(color: Colors.white),
            obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(
              hintText: 'Password',
              filled: true,
              fillColor: Colors.black38,
              hintStyle: TextStyle(color: AppColors.textSecondary.withValues(alpha: 0.7)),
              prefixIcon: const Icon(Icons.lock_open, color: AppColors.textSecondary),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          TextButtonApp.outline(
            title: 'Login',
            height: 50,
            width: double.infinity,
            borderColor: AppColors.border,
            borderWidth: 2,
            radius: 12,
            onPressed: () => CircularProgress.execute(context: context, function: onLogin),
            textStyle: TextStyle(color: AppColors.text),
          ),
          TextButtonApp.normal(
            title: 'Forgot password?',
            onPressed: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return ForgotPassword();
                }
            ),
            textStyle: TextStyle(color: AppColors.text),
          ),
          TextButtonApp.normal(
            title: 'Login with your voice',
            onPressed: () => onChangedLoginType(),
            textStyle: TextStyle(color: AppColors.text),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Text(
                "Don't Have An Account?",
                style: TextStyle(color: AppColors.textSecondary),
              ),
              TextButtonApp.normal(
                title: 'Sign Up',
                onPressed: () => context.pushNamed(RouteName.signUp),
                textStyle: TextStyle(color: AppColors.text),
              )
            ],
          ),
        ],
      ),
    );
  }
}
