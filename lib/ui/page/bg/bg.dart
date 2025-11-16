import 'package:flutter/material.dart';
class BackgroundPage extends StatelessWidget {
  const BackgroundPage({super.key, required this.child});

  final Widget child;

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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: child,
      ),
    );
  }
}
