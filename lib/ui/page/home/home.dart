import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:speech_to_text/ui/page/home/widgets/ask_elena_card.dart';
import 'package:speech_to_text/ui/page/home/widgets/bottom_wave.dart';
import 'package:speech_to_text/ui/page/home/widgets/suggestion_chips.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 50),
              child: Column(
                children: [
                  AskElenaCard(),
                  SuggestionChips(),
                  SvgPicture.asset(
                    'assets/icon/home.svg',
                    width: 300,
                    height: 300,
                    // colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn), // tuỳ chọn
                  ),
                ],
              ),
            )
          ),
          BottomWave(),
        ],
      )
    );
  }
}
