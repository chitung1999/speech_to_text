import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/ui/page/home/home.dart';
import 'package:speech_to_text/ui/page/login/login.dart';
import 'package:speech_to_text/ui/route/route_name.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    redirect: (context, state) {return null;},
    initialLocation: RouteName.home,
    debugLogDiagnostics: kDebugMode,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1, -1),
                end: Alignment(-1, 1),
                colors: [
                  Color(0xFF1B1745),
                  Color(0xFF1A1731),
                ],
              ),
            ),
            width: double.infinity,
            height: double.infinity,
            child: child,
          );
        },
        routes: [
          GoRoute(
            name: RouteName.login,
            path: RouteName.login,
            builder: (BuildContext context, GoRouterState state) {
              return const LoginPage();
            },
          ),
          GoRoute(
            name: RouteName.home,
            path: RouteName.home,
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
          ),
        ]
      ),
    ],
  );
}