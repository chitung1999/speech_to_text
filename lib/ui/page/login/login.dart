import 'package:flutter/material.dart';
import 'package:speech_to_text/ui/page/login/widget/content_login.dart';
import 'package:speech_to_text/ui/page/login/widget/header_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1, -1),
                end: Alignment(-1, 1),
                colors: [
                  Color(0xFF1B1745),
                  Color(0xFF1A1731),
                ],
              ),
            ),
            width: double.infinity,
            height: double.infinity,
          ),
          // Image.asset(
          //   'assets/image/bg.png',
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),
          GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderLogin(),
                Expanded(child: ContentLogin())
              ],
            ),
          )
        ],
      )
    );
  }
}
