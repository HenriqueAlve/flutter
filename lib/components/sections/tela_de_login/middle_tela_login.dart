import 'package:flutter/material.dart';

class MiddleTelaLogin extends StatelessWidget {
  const MiddleTelaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Bem vindo',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          'Faça login para entrar em nosso aplicativo',
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
