import 'package:flutter/material.dart';

import './features/splash/splash_page.dart';

final class BarbershopApp extends StatelessWidget {
  const BarbershopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blueshrine Barbershop',
      routes: {
        '/': (_) => const SplashPage(),
      },
    );
  }
}
