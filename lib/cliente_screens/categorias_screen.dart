import 'package:flutter/material.dart';
import 'package:meu_tcc/componets_cliente/categoria_screen/header_categoria_screen.dart';

class CategoriaScreenCliente extends StatelessWidget {
  const CategoriaScreenCliente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [HeaderCategoriaCliente()],
      ),
    );
  }
}
