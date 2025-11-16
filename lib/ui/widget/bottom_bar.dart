import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
    required this.isLoginScreen,
    this.onStartRecording,
    this.onEndRecording,
    this.onShowChat,
    this.onShowSetting
  });

  final bool isLoginScreen;
  final Function? onStartRecording;
  final Function? onEndRecording;
  final Function? onShowChat;
  final Function? onShowSetting;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  bool _isRecording = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 40),
            SvgPicture.asset(
              'assets/bg/bottom_bg.svg',
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
        Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: () {
              setState(() {_isRecording = !_isRecording;});
              _isRecording ? widget.onStartRecording?.call() : widget.onEndRecording?.call();
            },
            child: Lottie.asset(
              _isRecording ? 'assets/lottie/recording.json' : 'assets/lottie/micro.json',
              width: 110,
              height: 110,
              repeat: true,
            ),
          ),
        ),
        if (!widget.isLoginScreen)
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 100,
            children: [
              IconButton(
                icon: Icon(
                  Icons.chat,
                  size: 20,
                  color: AppColors.iconLight,
                ),
                onPressed: () => widget.onShowChat!()
              ),
              IconButton(
                icon: Icon(
                  Icons.settings,
                  size: 20,
                  color: AppColors.iconLight,
                ),
                  onPressed: () => widget.onShowSetting!()
              ),
            ],
          ),
        ),
      ]
    );
  }
}
