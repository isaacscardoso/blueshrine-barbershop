import 'package:flutter/widgets.dart';

import './features/auth/login/login_page.dart';
import './features/splash/splash_page.dart';

sealed class BarbershopRoutes {
  static const String splash = '/';
  static const String login = '/auth/login';

  static Map<String, WidgetBuilder> get routes {
    return {
      splash: (_) => const SplashPage(),
      login: (_) => const LoginPage(),
    };
  }
}
