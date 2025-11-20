import 'package:flutter/material.dart';
import 'package:speech_to_text/ui/page/bg/bg.dart';
import 'package:speech_to_text/ui/page/login/widget/login_account.dart';
import 'package:speech_to_text/ui/page/login/widget/login_voice.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoginVoice = true;

  void _onChangedLoginType() {
    setState(() {_isLoginVoice = !_isLoginVoice;});
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _isLoginVoice
            ? LoginVoice(onChangedLoginType: _onChangedLoginType)
            : LoginAccount(onChangedLoginType: _onChangedLoginType),
      ),
    );
  }
}
