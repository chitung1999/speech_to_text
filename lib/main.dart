import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/core/global_variables/app_config.dart';
import 'package:speech_to_text/domain/repositories/local/shared_preference.dart';
import 'package:speech_to_text/ui/route/route.dart';
import 'package:speech_to_text/presentation/generated/locales/codegen_loader.g.dart';
import 'domain/di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final permission = await Permission.microphone.request();

  if (!permission.isGranted) {
    runApp(RequestPermissionPage());
  } else {
    await setupLocator();
    final prefs = getIt<SharedPreferencesApp>();
    String language = await prefs.getLanguage();
    appConfig.setLoginStatus(await prefs.getLoginStatus());
    runApp(
        EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('vi')],
          path: 'assets/translations',
          assetLoader: const CodegenLoader(),
          fallbackLocale: const Locale('en'),
          startLocale: Locale(language),
          child: const MyApp(),
        )
    );
  }
}

class RequestPermissionPage extends StatelessWidget {
  const RequestPermissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextButton(onPressed: () async => await openAppSettings(), child: const Text("Open Settings"),
          ),
        ))
    );
  }
}







class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}