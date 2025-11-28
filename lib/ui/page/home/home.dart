import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/core/enums/status.dart';
import 'package:speech_to_text/core/function/record.dart';
import 'package:speech_to_text/domain/di/di.dart';
import 'package:speech_to_text/domain/models/record/record_response.dart';
import 'package:speech_to_text/domain/models/result/result.dart';
import 'package:speech_to_text/domain/repositories/remote/remote_data.dart';
import 'package:speech_to_text/ui/dialog/command_notification.dart';
import 'package:speech_to_text/ui/page/bg/bg.dart';
import 'package:speech_to_text/ui/page/home/widgets/whisper_text.dart';
import 'package:speech_to_text/ui/page/home/widgets/header_home.dart';
import 'package:speech_to_text/ui/page/home/widgets/suggestion_chips.dart';
import 'package:speech_to_text/ui/route/route_name.dart';
import 'package:speech_to_text/ui/page/home/widgets/bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.fullName});

  final String fullName;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isRecording = false;
  String message = 'Say something...';

  Future<void> _onRecording() async {
    setState(() {
      message = 'Listening...';
      _isRecording = true;
    });

    await RecordApp.startRecording();
  }

  Future<void> _onEndRecording() async {
    await RecordApp.endRecording();

    final remoteData = getIt<RemoteData>();
    final Result<RecordResponse> result = await remoteData.onSpeechToText();

    if (result.status == Status.success && result.data!.text.isNotEmpty) {
      setState(() => message = result.data!.text);
      await Future.delayed(const Duration(seconds: 2));

      if (result.data!.command.isNotEmpty && mounted) {
        await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (_) => CommandNotification(text: result.data!.command)
        );
      }
    }

    setState(() {
      message = 'Say something...';
      _isRecording = false;
    });
  }

  Future<void> _onSuggested (String label) async {
    if (_isRecording) return;
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => CommandNotification(text: label)
    );
  }

  void _onShowChat() {

  }

  void _onShowSetting() {
    if (_isRecording) return;
    context.pushNamed(RouteName.setting, queryParameters: {'fullName': widget.fullName});
  }

  @override
  Widget build(BuildContext context) {
    final double fixedHeight = 160;
    return BackgroundPage(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: fixedHeight),
                Expanded(
                  child: Container(
                    color: AppColors.bgContent,
                  ),
                )
              ],
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                child: Column(
                  spacing: 20,
                  children: [
                    SizedBox(
                      height: fixedHeight - 100,
                      child: HeaderHome(fullName: widget.fullName)
                    ),
                    WhisperText(message: message),
                    Expanded(
                        child: SuggestionChips(onTap: _onSuggested)
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomBar(
          onStartRecording: _onRecording,
          onEndRecording: _onEndRecording,
          onShowChat: () => _onShowChat,
          onShowSetting: _onShowSetting
        ),
      )
    );
  }
}
