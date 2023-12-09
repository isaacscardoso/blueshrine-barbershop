import 'package:flutter/material.dart';

import '../../barbershop_routes.dart';
import '../auth/login/login_page.dart';

final class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _scale = 10.0;
  double _logoOpacityAnimation = 0.0;

  // Os valores sao diretamente proporcionais ao tamanho final da imagem.
  double get _logoAnimationScaleWidth => 100.0 * _scale;
  double get _logoAnimationScaleHeight => 120.0 * _scale;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _logoOpacityAnimation = 1.0;
        _scale = 1.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.3,
            image: AssetImage('assets/images/background_image_chair.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(seconds: 4),
            curve: Curves.easeIn,
            opacity: _logoOpacityAnimation,
            onEnd: () async {
              await Future.delayed(const Duration(seconds: 1), () {
                Navigator.of(context).pushAndRemoveUntil(
                  PageRouteBuilder(
                    settings: const RouteSettings(name: BarbershopRoutes.login),
                    pageBuilder: (_, animation, secondaryAnimation) {
                      return const LoginPage();
                    },
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ),
                  (route) => false,
                );
              });
            },
            child: AnimatedContainer(
              duration: const Duration(seconds: 4),
              curve: Curves.linearToEaseOut,
              width: _logoAnimationScaleWidth,
              height: _logoAnimationScaleHeight,
              child: Image.asset(
                'assets/images/imgLogo.png',
                scale: 0.8,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
