import 'package:flutter/material.dart';
import 'package:meu_tcc/components/sections/controle_de_estoque/header_estoque.dart';
import 'package:meu_tcc/components/sections/controle_de_estoque/lista_de_estoque.dart';

class ControleDeEstoque extends StatefulWidget {
  const ControleDeEstoque({super.key});

  @override
  _ControleDeEstoqueState createState() => _ControleDeEstoqueState();
}

class _ControleDeEstoqueState extends State<ControleDeEstoque> {
  String searchQuery = '';

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestão do estoque'),
      ),
      body: Column(
        children: [
          HeaderEstoque(onSearch: updateSearchQuery),
          Expanded(
            child: SingleChildScrollView(
              child: ListaDeEstoque(searchQuery: searchQuery),
            ),
          ),
        ],
      ),
    );
  }
}
