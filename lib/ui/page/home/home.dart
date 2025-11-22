import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/ui/page/bg/bg.dart';
import 'package:speech_to_text/ui/page/home/widgets/ask_elena_card.dart';
import 'package:speech_to_text/ui/page/home/widgets/suggestion_chips.dart';
import 'package:speech_to_text/ui/route/route_name.dart';
import 'package:speech_to_text/ui/widget/avatar.dart';
import '../../widget/bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String message = 'Say something...';

  void _onRecording() {
    setState(() {
      message = 'Listening...';
    });
  }
  void _onEndRecording() {
    setState(() {
      message = 'Hi, I am Elena. How can I help you?';
    });
  }

  void _onSuggested (String label) {
    setState(() {
      message = label;
    });
  }

  void _onShowSetting() {
    context.pushNamed(RouteName.setting);
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  spacing: 20,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                            "Hi Lan",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )
                        ),
                        Avatar(size: 30, isShowName: false)
                      ],
                    ),
                    AskElenaCard(message: message),
                    Expanded(
                        child: SuggestionChips(onTap: _onSuggested)
                    ),
                  ],
                ),
              ),
            ),
            BottomBar(
              isLoginScreen: false,
              onStartRecording: _onRecording,
              onEndRecording: _onEndRecording,
              onShowSetting: _onShowSetting,
            )
          ]
        ),
      )
    );
  }
}
