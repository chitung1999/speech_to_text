import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/ui/page/bg/bg.dart';
import 'package:speech_to_text/ui/page/home/widgets/ask_elena_card.dart';
import 'package:speech_to_text/ui/page/home/widgets/suggestion_chips.dart';
import 'package:speech_to_text/ui/route/route_name.dart';
import '../../widget/bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _onRecording() {}
  void _onEndRecording() {}

  void _onShowSetting() {
    context.pushNamed(RouteName.setting);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundPage(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  // padding: EdgeInsets.symmetric(horizontal: 0, vertical: 50),
                  child: Column(
                    children: [
                      AskElenaCard(),
                      SuggestionChips(),
                    ],
                  ),
                )
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
      )
    );
  }
}
