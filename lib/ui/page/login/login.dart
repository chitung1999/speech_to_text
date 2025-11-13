import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:speech_to_text/ui/page/home/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false;

  void _changeColor() {
    setState(() {
      _isChecked = !_isChecked;
    });
  }

  void _onLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1B1745), Color(0xFF1A1731)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Container(width: screenSize.width, height: 100, color: Colors.red,),
            SvgPicture.asset(
              'icon/icon_1.svg',
              width: 100,
              height: 100,
              // colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn), // tuỳ chọn
            ),
            SvgPicture.asset(
              'bg/bg_1.svg',
              width: screenSize.width,
              fit: BoxFit.fitWidth,
              // colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn), // tuỳ chọn
            ),
          ],
        ),
      )
    );
  }
}
