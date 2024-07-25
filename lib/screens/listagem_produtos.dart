import 'package:flutter/material.dart';
import 'package:meu_tcc/components/sections/lista_de_produtos/lista_de_produtos.dart';

class TodosProdutosScreen extends StatelessWidget {
  const TodosProdutosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Produtos',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListaDeProdutos(),
            ],
          ),
        ));
  }
}
