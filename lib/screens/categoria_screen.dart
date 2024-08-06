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
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeCategoria(),
            SizedBox(
              height: 20,
            ),
            Text('Adicionar uma nova categoria'),
            SizedBox(
              height: 20,
            ),
            MiddleCategoria()
          ],
        ),
      ),
    );
  }
}
