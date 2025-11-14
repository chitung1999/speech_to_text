import 'package:flutter/material.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/core/constants/app_text_styles.dart';

class AskElenaCard extends StatelessWidget {
  const AskElenaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.only(bottom: 75),
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 151, left: 23),
                  child: const Text(
                    "Ask Elena",
                    style: AppTextStyles.heading,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 25),
                transform: Matrix4.translationValues(0, 35, 0),
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/svbrKIT7w1/21px6vvx_expires_30_days.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        debugPrint('Pressed');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.accent,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(23),
                        ),
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.only(bottom: 15, left: 35),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.accent,
                          ),
                          width: 21,
                          height: 21,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 35),
                      width: 291,
                      child: const Text(
                        "Hi, I am Elena.\nWhat can I do for you today?",
                        style: AppTextStyles.body,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
