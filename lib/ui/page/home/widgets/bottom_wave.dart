import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomWave extends StatelessWidget {
  const BottomWave({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 121, // Adjusted height to accommodate the positioned element
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 23,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              "assets/icon/listening.svg",
              fit: BoxFit.fill,
              height: 98,
            ),
          ),
          Positioned(
            top: 0,
            left: 148,
            right: 148,
            child: Image.asset(
              "assets/icon/mirco.png",
              fit: BoxFit.fill,
              height: 91,
            ),
          ),
        ],
      ),
    );
  }
}
