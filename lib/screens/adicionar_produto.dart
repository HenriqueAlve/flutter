import 'package:flutter/material.dart';
import 'package:meu_tcc/components/sections/adcionar_produto/adicionar_produto.dart';

class AdicionarProdutos extends StatelessWidget {
  const AdicionarProdutos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adicionar novo produto',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [HeaderAdicionarProduto()],
        ),
      ),
    );
  }
}
