import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
    required this.onStartRecording,
    required this.onEndRecording,
    required this.onShowChat,
    required this.onShowSetting
  });

  final Function onStartRecording;
  final Function onEndRecording;
  final Function onShowChat;
  final Function onShowSetting;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  bool _isRecording = false;

  @override
  Widget build(BuildContext context) {
    final double sizeMicro = 130;

    return IntrinsicHeight(
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(child: Container(color: AppColors.bgContent)),
              Container(
                color: AppColors.white,
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => widget.onShowChat(),
                        behavior: HitTestBehavior.opaque,
                        child: Icon(
                          Icons.chat,
                          color: AppColors.iconBottomNavigation,
                        ),
                      ),
                    ),
                    SizedBox(width: 130),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => widget.onShowSetting(),
                        behavior: HitTestBehavior.opaque,
                        child: Icon(
                          Icons.settings,
                          color: AppColors.iconBottomNavigation,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                _isRecording ? widget.onEndRecording() : widget.onStartRecording();
                setState(() => _isRecording = !_isRecording);
              },
              child: Lottie.asset(
                _isRecording ? 'assets/lottie/recording.json'
                    : 'assets/lottie/micro.json',
                width: sizeMicro,
                height: sizeMicro,
                repeat: true,
              ),
            ),
          ),
        ]
      ),
    );
  }
}
