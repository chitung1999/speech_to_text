import 'package:flutter/material.dart';
import 'package:speech_to_text/ui/page/home/add_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isChecked = false;

  void _changeColor() {
    setState(() {
      _isChecked = !_isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.blue,
          width: 100, height: 100,
          child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddInfoPage()),
                );
              },
              child: const Text("Home", style: TextStyle(color: Colors.white))
          ),
        ),
      ),
    );
  }
}
