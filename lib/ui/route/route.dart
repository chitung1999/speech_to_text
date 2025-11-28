import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/ui/page/home/home.dart';
import 'package:speech_to_text/ui/page/login/login.dart';
import 'package:speech_to_text/ui/page/setting/setting.dart';
import 'package:speech_to_text/ui/page/sign_up/sign_up.dart';
import 'package:speech_to_text/ui/page/startup/startup_app.dart';
import 'package:speech_to_text/ui/route/route_name.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    redirect: (context, state) {return null;},
    // initialLocation: RouteName.setting,
    debugLogDiagnostics: kDebugMode,
    routes: [
      GoRoute(
        name: RouteName.startupApp,
        path: RouteName.startupApp,
        pageBuilder: (context, state) => const NoTransitionPage(child: StartupApp()),
      ),
      GoRoute(
        name: RouteName.login,
        path: RouteName.login,
        pageBuilder: (context, state) => const NoTransitionPage(child: LoginPage()),
      ),
      GoRoute(
        name: RouteName.home,
        path: RouteName.home,
        pageBuilder: (context, state) {
          String fullName = state.uri.queryParameters['fullName'] ?? '';
          return NoTransitionPage(child: HomePage(fullName: fullName));
        },
      ),
      GoRoute(
        name: RouteName.setting,
        path: RouteName.setting,
        pageBuilder: (context, state) {
          String fullName = state.uri.queryParameters['fullName'] ?? '';
          return NoTransitionPage(child: SettingPage(fullName: fullName));
        },
      ),
      GoRoute(
        name: RouteName.signUp,
        path: RouteName.signUp,
        pageBuilder: (context, state) => const NoTransitionPage(child: SignUpPage()),
      ),
    ],
  );
}
