import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/domain/repositories/local/shared_preference.dart';
import 'package:speech_to_text/ui/route/route.dart';
import 'package:speech_to_text/presentation/generated/locales/codegen_loader.g.dart';
import 'domain/di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  final prefs = getIt<SharedPreferencesApp>();
  String language = await prefs.getLanguage();
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