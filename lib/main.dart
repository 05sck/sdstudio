import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:sdstudio/core/theme/theme_provider.dart';

import 'package:sdstudio/pages/web_main_page.dart';
import 'package:sdstudio/services/auth/auth_gate.dart';

void main() {
  if (kIsWeb) {
    runApp(WebApp());
  } else {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
          ),
        ],
        child: const MobileApp(),
      ),
    );
  }
}

// Mobile App for Attendee
class MobileApp extends StatelessWidget {
  const MobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return WebApp();
    }
    return MaterialApp(
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

// Web App for Administrator
class WebApp extends StatelessWidget {
  final _router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WebMainPage(),
    )
  ]);

  WebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
