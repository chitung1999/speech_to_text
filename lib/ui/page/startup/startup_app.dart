import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_master/permission_master.dart';
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
  final _permissionMaster = PermissionMaster();

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
    final status = await _permissionMaster.requestMicrophonePermission();


    if (status == PermissionStatus.granted) {
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
    final status = await _permissionMaster.checkPermissionStatus(PermissionType.microphone.value);

    if (status == PermissionStatus.granted) {
      await _goNextScreen();
    }
  }

  Widget _permissionDialog () {
    return AlertDialog(
      title: const Text("Microphone Permission"),
      content: const Text("The app needs microphone access to function properly. "
          "Please open Settings and grant the permission."),
      actions: [
        TextButton(
          onPressed: () async {
            context.pop();
            await _permissionMaster.openAppSettings();
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
