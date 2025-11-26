import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/domain/di/di.dart';
import 'package:speech_to_text/domain/repositories/local/shared_preference.dart';
import 'package:speech_to_text/domain/repositories/remote/remote_data.dart';
import 'package:speech_to_text/ui/route/route_name.dart';
import 'package:speech_to_text/ui/widget/bottom_bar.dart';
import 'package:speech_to_text/ui/widget/text_button_app.dart';

import '../../../widget/circular_progress.dart';

class LoginVoice extends StatefulWidget {
  const LoginVoice({super.key, required this.onChangedLoginType});

  final Function onChangedLoginType;

  @override
  State<LoginVoice> createState() => _LoginVoiceState();
}

class _LoginVoiceState extends State<LoginVoice> {
  final _remoteData = getIt<RemoteData>();
  String _strPassword = 'Speak your password';

  Future<void> _onLogin() async {
    setState(() {
      _strPassword = '**************';
    });

    // final Result<dynamic> result = await _remoteData.getUser('IJCx2pwsCTb6pkyb6yasig==');
    // print(result.data);

    await Future.delayed(const Duration(seconds: 1));

    if(mounted) {
      final prefs = getIt<SharedPreferencesApp>();
      prefs.setLoginStatus(true);
      context.replaceNamed(RouteName.home);
    }
  }

  void _onRecording() {
    setState(() {
      _strPassword = 'Speak your password';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
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
                'Press the record button and speak your password to log in.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                height: 60,
                child: Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.lock_outline, color: AppColors.textSecondary),
                    Text(
                      _strPassword,
                      style: TextStyle(color: AppColors.textSecondary.withValues(alpha: 0.7)),
                    )
                  ],
                ),
              ),
              TextButtonApp.normal(
                title: 'Login with your account',
                onPressed: () => widget.onChangedLoginType(),
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
        ),
        BottomBar(
          isLoginScreen: true,
          onStartRecording: _onRecording,
          onEndRecording: () => CircularProgress.execute(context: context, function: _onLogin),
        )
      ],
    );
  }
}
