import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoBack extends StatelessWidget implements PreferredSizeWidget {
  const GoBack({super.key, required this.title, required this.style});

  final String title;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        spacing: 10,
        children: [
          GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.white,
            ),
            onTap: () => context.pop()
          ),
          Text(title, style: style),
        ],
      ),
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}