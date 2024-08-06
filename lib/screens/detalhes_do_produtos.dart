import 'package:flutter/material.dart';
import 'package:meu_tcc/components/sections/detalhes_do_produto/detalhes_do_produto.dart';
import 'package:meu_tcc/components/sections/detalhes_do_produto/detalhes_do_produto_vendas.dart';
import 'package:meu_tcc/components/sections/detalhes_do_produto/detalhes_produto_estoque.dart';
import 'package:meu_tcc/data/produtos.model.dart'; // Ajuste o caminho do arquivo conforme necessário

class DetalhesDoProdutos extends StatelessWidget {
  final ProdutoDTO produto;

  const DetalhesDoProdutos({Key? key, required this.produto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PaoManager',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          HeaderDetalhesDoProduto(
            produto: produto,
          ),
          SizedBox(
            height: 15,
          ),
          DetalhesEstoque(
            produto: produto,
          ),
          SizedBox(
            height: 15,
          ),
          DetalhesVendas(
            produto: produto,
          )
        ],
      ),
    );
  }
}
