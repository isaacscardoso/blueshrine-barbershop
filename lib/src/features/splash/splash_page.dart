import 'package:flutter/material.dart';
import 'package:asyncstate/asyncstate.dart';

final class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Page'),
      ),
      body: SafeArea(
        child: ElevatedButton(
          onPressed: () async {
            await Future.delayed(const Duration(seconds: 2)).asyncLoader();
          },
          child: const Text('Loader testing...'),
        ),
      ),
    );
  }
}
