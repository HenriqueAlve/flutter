import 'package:flutter/material.dart';
import 'package:meu_tcc/components/sections/tela_de_login/formulario_de_login.dart';
import 'package:meu_tcc/components/sections/tela_de_login/header_login.dart';
import 'package:meu_tcc/components/sections/tela_de_login/middle_tela_login.dart';

class TelaDeLogin extends StatelessWidget {
  const TelaDeLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            HeaderLogin(),
            SizedBox(
              height: 50,
            ),
            MiddleTelaLogin(),
            SizedBox(
              height: 30,
            ),
            FormularioDeLogin(),
          ],
        ),
      ),
    );
  }
}
