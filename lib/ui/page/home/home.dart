import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/core/enums/status.dart';
import 'package:speech_to_text/core/function/record.dart';
import 'package:speech_to_text/domain/di/di.dart';
import 'package:speech_to_text/domain/models/record/record_response.dart';
import 'package:speech_to_text/domain/models/result/result.dart';
import 'package:speech_to_text/domain/repositories/remote/remote_data.dart';
import 'package:speech_to_text/ui/page/bg/bg.dart';
import 'package:speech_to_text/ui/page/home/widgets/ask_elena_card.dart';
import 'package:speech_to_text/ui/page/home/widgets/suggestion_chips.dart';
import 'package:speech_to_text/ui/route/route_name.dart';
import 'package:speech_to_text/ui/widget/avatar.dart';
import 'package:speech_to_text/ui/widget/bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.fullName});

  final String fullName;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String message = 'Say something...';

  Future<void> _onRecording() async {
    setState(() {
      message = 'Listening...';
    });

    await RecordApp.startRecording();
  }
  Future<void> _onEndRecording() async {
    await RecordApp.endRecording();

    final remoteData = getIt<RemoteData>();
    final Result<RecordResponse> result = await remoteData.onSpeechToText();

    setState(() {
      message = result.status == Status.success
        ? result.data!.text
        : 'Say something...';
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
                        Text(
                          "Hi ${widget.fullName}",
                          style: const TextStyle(
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
