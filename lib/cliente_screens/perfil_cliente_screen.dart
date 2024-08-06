import 'package:flutter/material.dart';
import 'package:meu_tcc/componets_cliente/perfil_cliente/header_perfil_cliente.dart';

class PerfilClienteScreen extends StatelessWidget {
  const PerfilClienteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sua conta'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderPerfilCliente(),
          ],
        ),
      ),
    );
  }
}
