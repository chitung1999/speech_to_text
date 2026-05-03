import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/domain/repositories/local/shared_preference.dart';
import 'package:speech_to_text/ui/route/route.dart';
import 'package:speech_to_text/ui/generated/locales/codegen_loader.g.dart';
import 'domain/di/di.dart';

Future<String> _resolveLanguage() async {
  final prefs = getIt<SharedPreferencesApp>();
  String language = await prefs.getLanguage();

  // Nếu chưa lưu, thử theo ngôn ngữ hệ thống; mặc định về 'vi'
  if (language.isEmpty) {
    final deviceLang = WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    language = deviceLang == 'vi' ? 'vi' : 'vi';
    await prefs.setLanguage(language);
  }

  // Nếu giá trị không hợp lệ, fallback về 'vi'
  if (language != 'en' && language != 'vi') {
    language = 'vi';
    await prefs.setLanguage(language);
  }

  return language;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  final String language = await _resolveLanguage();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('vi')],
      path: 'assets/translations',
      assetLoader: const CodegenLoader(),
      fallbackLocale: const Locale('en'),
      startLocale: Locale(language),
      child: const MyApp(),
    ),
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