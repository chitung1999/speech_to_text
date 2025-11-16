import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:speech_to_text/core/constants/app_text_styles.dart';

class AskElenaCard extends StatelessWidget {
  final bool isRecording;

  const AskElenaCard({super.key, required this.isRecording});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 50, bottom: 20),
            child: const Text(
              "Hi Lan",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )
            ),
          ),
          Container(
            height: 185,
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.black38,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  SvgPicture.asset(
                    "assets/icon/listening.svg",
                    fit: BoxFit.fill,
                    height: 50,
                  ),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SingleChildScrollView(
                          child: Text(
                            isRecording ? "Listening..." : "Say something...",
                            style: AppTextStyles.body,
                          )
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}