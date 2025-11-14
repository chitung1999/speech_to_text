import 'package:flutter/material.dart';
import 'package:speech_to_text/ui/page/home/widgets/ask_elena_card.dart';
import 'package:speech_to_text/ui/page/home/widgets/suggestion_chips.dart';
import 'package:speech_to_text/ui/page/home/widgets/bottom_wave.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AskElenaCard(),
              SuggestionChips(),
              BottomWave(),
            ],
          )
      ),
    );
  }
}
