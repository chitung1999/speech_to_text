import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/ui/page/forgot_password/forgot_password.dart';
import 'package:speech_to_text/ui/page/home/home.dart';
import 'package:speech_to_text/ui/page/login/login.dart';
import 'package:speech_to_text/ui/page/setting/setting.dart';
import 'package:speech_to_text/ui/page/sign_up/sign_up.dart';
import 'package:speech_to_text/ui/route/route_name.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    redirect: (context, state) {return null;},
    initialLocation: RouteName.setting,
    debugLogDiagnostics: kDebugMode,
    routes: [
      GoRoute(
        name: RouteName.login,
        path: RouteName.login,
        pageBuilder: (context, state) => const NoTransitionPage(child: LoginPage()),
      ),
      GoRoute(
        name: RouteName.home,
        path: RouteName.home,
          pageBuilder: (context, state) => const NoTransitionPage(child: HomePage()),
      ),
      GoRoute(
        name: RouteName.setting,
        path: RouteName.setting,
        pageBuilder: (context, state) => const NoTransitionPage(child: SettingPage()),
      ),
      GoRoute(
        name: RouteName.signUp,
        path: RouteName.signUp,
        pageBuilder: (context, state) => const NoTransitionPage(child: SignUpPage()),
      ),
      GoRoute(
        name: RouteName.forgotPassword,
        path: RouteName.forgotPassword,
        pageBuilder: (context, state) => const NoTransitionPage(child: ForgotPasswordPage()),
      ),
    ],
  );
}
