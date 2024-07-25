import 'package:flutter/material.dart';
import 'package:meu_tcc/components/sections/categorias/home_categoria.dart';
import 'package:meu_tcc/components/sections/categorias/middle_categoria.dart';

class CategoriaScreen extends StatelessWidget {
  const CategoriaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: Column(
        children: [
          HomeCategoria(),
          SizedBox(
            height: 20,
          ),
          Text('Adicionar/editar categoria'),
          SizedBox(
            height: 20,
          ),
          MiddleCategoria()
        ],
      ),
    );
  }
}
