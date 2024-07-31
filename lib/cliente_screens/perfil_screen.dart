import 'package:flutter/material.dart';
import 'package:meu_tcc/componets_cliente/perfil_screen_cliente/header_perfil_cliented.dart';
import 'package:meu_tcc/componets_cliente/perfil_screen_cliente/informa%C3%A7oes_perfil_cliente.dart';

class PerfilScreenCliente extends StatelessWidget {
  const PerfilScreenCliente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HeaderClienteScreen(),
          Padding(
            padding: const EdgeInsets.only(
              top: 275,
            ),
            child: InformacoesPerfilCliente(),
          ),
        ],
      ),
    );
  }
}
