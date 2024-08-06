import 'package:flutter/material.dart';
import 'package:meu_tcc/componets_cliente/DetalhesDoProdutoScreen/header_detalhes_produtos.dart';
import 'dart:typed_data';
import 'package:meu_tcc/data/produtos.model.dart';

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
    final produto = ProdutoDTO(
      id: 0, // valor temporário
      nome: nomeProduto,
      preco: precoProduto,
      quantidadeNoEstoque: 0, // valor temporário
      imagemBytes: imagemProduto,
      categoriaDTO:
          CategoriaDTO(id: 0, nome: 'Categoria Temporária'), // valor temporário
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(nomeProduto),
      ),
      body: HeaderDetalhesProdutos(
        produto: produto,
      ),
    );
  }
}
