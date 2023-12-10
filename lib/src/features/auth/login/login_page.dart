import 'package:flutter/material.dart';

import '../../../core/ui/components/custom_text_form_field.dart';
import '../../../core/ui/styles/app_colors.dart';

final class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/imgLogo.png'),
                        const SizedBox(height: 32),
                        const CustomTextFormField(label: 'E-mail'),
                        const SizedBox(height: 20),
                        const CustomTextFormField(label: 'Senha'),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(56),
                          ),
                          onPressed: () {},
                          child: const Text('Entrar'),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Esqueceu a senha?',
                          style: TextStyle(
                            color: AppColors.brown,
                          ),
                        ),
                      ],
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Criar conta',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
