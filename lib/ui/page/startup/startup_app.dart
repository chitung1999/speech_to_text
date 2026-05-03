import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/domain/di/di.dart';
import 'package:speech_to_text/domain/repositories/local/shared_preference.dart';
import 'package:speech_to_text/ui/route/route_name.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    _requestPermission();
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

  Future<void> _goNextScreen() async {
    final prefs = getIt<SharedPreferencesApp>();
    String token = await prefs.getToken();
    String fullName = await prefs.getFullName();

    // Loading assets to RAM
    final svgPaths = [
      'assets/bg/bg.svg',
      'assets/icon/avatar.svg',
      'assets/icon/listening.svg',
      'assets/icon/listening_2.svg',
    ];
    for (final path in svgPaths) {
      final loader = SvgAssetLoader(path);
      await svg.cache.putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }

    final lottiePaths = [
      'assets/lottie/micro.json',
      'assets/lottie/recording.json',
    ];
    for (final path in lottiePaths) {
      await rootBundle.load(path);
      await AssetLottie(path).load();
    }

    if (mounted) {
      if (token.isEmpty) {
        context.replaceNamed(RouteName.login);
      } else {
        context.replaceNamed(RouteName.home, queryParameters: {'fullName': fullName});
      }
    }
  }

  Future<void> _requestPermission() async {
    final status = await Permission.microphone.request();

    if (status.isGranted) {
      await _goNextScreen();
    } else if (mounted) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => _permissionDialog()
      );
    }
  }

  Future<void> _checkPermission() async {
    final status = await Permission.microphone.status;

    if (status.isGranted) {
      await _goNextScreen();
    }
  }

  Widget _permissionDialog () {
    return AlertDialog(
      title: Text('startup.microphone_permission'.tr()),
      content: Text('startup.permission_message'.tr()),
      actions: [
        TextButton(
          onPressed: () {
            openAppSettings();
            context.pop();
          },
          child: Text('startup.open_setting'.tr()),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
