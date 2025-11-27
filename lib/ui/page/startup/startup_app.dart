import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/domain/di/di.dart';
import 'package:speech_to_text/domain/repositories/local/shared_preference.dart';
import 'package:speech_to_text/ui/route/route_name.dart';

class StartupApp extends StatefulWidget {
  const StartupApp({super.key});

  @override
  State<StartupApp> createState() => _StartupAppState();
}

class _StartupAppState extends State<StartupApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkPermission();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkPermission();
    }
  }

  Future<void> _checkPermission() async {
    final status = await Permission.microphone.request();

    if (status.isGranted) {
      final prefs = getIt<SharedPreferencesApp>();
      String token = await prefs.getToken();
      String fullName = await prefs.getFullName();

      if (mounted) {
        if (token.isEmpty) {
          context.replaceNamed(RouteName.login);
        } else {
          context.replaceNamed(RouteName.home, queryParameters: {'fullName': fullName});
        }
      }
      return;
    }

    if ((status.isDenied || status.isPermanentlyDenied) && mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => _permissionDialog()
      );
    }
  }

  Widget _permissionDialog () {
    return AlertDialog(
      title: const Text("Microphone Permission"),
      content: const Text("The app needs microphone access to function properly. "
              "Please open Settings and grant the permission."),
      actions: [
        TextButton(
          onPressed: () {
            openAppSettings();
            context.pop();
          },
          child: const Text("Open Setting"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
