import 'package:flutter/material.dart';
import 'package:meu_tcc/componets_cliente/DetalhesDoProdutoScreen/header_detalhes_produtos.dart';
import 'dart:typed_data';

class DetalhesDoProdutoScreen extends StatelessWidget {
  final String nomeProduto;
  final Uint8List? imagemProduto;
  final double precoProduto;

  const DetalhesDoProdutoScreen({
    super.key,
    required this.nomeProduto,
    this.imagemProduto,
    required this.precoProduto,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nomeProduto),
      ),
    );
  }
}


//*body: HeaderDetalhesProdutos(
   //     imagemProduto: imagemProduto,
    //    nomeProduto: nomeProduto,
  //      precoProduto: precoProduto,/* 