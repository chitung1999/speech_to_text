import 'package:flutter/material.dart';

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
            child: Image.network(
              "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/svbrKIT7w1/8iw1ai3r_expires_30_days.png",
              fit: BoxFit.fill,
              height: 98,
            ),
          ),
          Positioned(
            top: 0,
            left: 148,
            right: 148,
            child: Image.network(
              "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/svbrKIT7w1/9ty43css_expires_30_days.png",
              fit: BoxFit.fill,
              height: 91,
            ),
          ),
        ],
      ),
    );
  }
}
