import 'package:flutter/material.dart';

class AddInfoPage extends StatefulWidget {
  const AddInfoPage({super.key});

  @override
  State<AddInfoPage> createState() => _AddInfoPageState();
}

class _AddInfoPageState extends State<AddInfoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.blue,
          width: 100, height: 100,
          child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back", style: TextStyle(color: Colors.white))
          ),
        ),
      ),
    );
  }
}
