import 'package:flutter/material.dart';
import 'package:asyncstate/asyncstate.dart';

import './barbershop_routes.dart';
import './core/ui/widgets/barbershop_loader.dart';

final class BarbershopApp extends StatelessWidget {
  const BarbershopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      customLoader: const BarbershopLoader(),
      builder: (asyncNavigatorObserver) {
        return MaterialApp(
          title: 'Blueshrine Barbershop',
          navigatorObservers: [asyncNavigatorObserver],
          routes: BarbershopRoutes.routes,
        );
      },
    );
  }
}
