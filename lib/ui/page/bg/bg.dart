import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class BackgroundPage extends StatelessWidget {
  const BackgroundPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: SvgPicture.asset(
            'assets/bg/bg.svg',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
        ),
        child
      ],
    );
    // return Container(
    //   decoration: BoxDecoration(
    //     gradient: LinearGradient(
    //       begin: Alignment(-1, -1),
    //       end: Alignment(-1, 1),
    //       colors: [
    //         Color(0xFF1B1745),
    //         Color(0xFF1A1731),
    //       ],
    //     ),
    //   ),
    //   width: double.infinity,
    //   height: double.infinity,
    //   child: child
    // );
  }
}