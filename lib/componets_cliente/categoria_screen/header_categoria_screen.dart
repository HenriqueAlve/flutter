import 'package:flutter/material.dart';
import 'package:meu_tcc/data/produtos.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:meu_tcc/main.dart';

class HeaderCategoriaCliente extends StatefulWidget {
  const HeaderCategoriaCliente({super.key});

  @override
  State<HeaderCategoriaCliente> createState() => _HeaderCategoriaClienteState();
}

class _HeaderCategoriaClienteState extends State<HeaderCategoriaCliente> {
  List<CategoriaDTO> _categorias = [];

  @override
  void initState() {
    super.initState();
    _fetchCategorias();
  }

  Future<void> _fetchCategorias() async {
    final response = await http
        .get(Uri.parse('http://192.168.100.2:8080/api/categoria/listar'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        _categorias = data.map((json) => CategoriaDTO.fromJson(json)).toList();
      });
    } else {
      // Tratar erro de requisição
      print('Erro ao carregar categorias: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 55, right: 150),
          child: Container(
            width: 150,
            height: 50,
            child: Text(
              'Categorias',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Container(
            width: 350,
            height: 650,
            child: _categorias.isEmpty
                ? Center(child: LoadingIndicator())
                : ListView.builder(
                    itemCount: _categorias.length,
                    itemBuilder: (context, index) {
                      final categoria = _categorias[index];
                      return ListTile(
                        title: Text(categoria.nome),
                        onTap: () {
                          // Ação ao clicar na categoria, se necessário
                        },
                      );
                    },
                  ),
          ),
        )
      ],
    );
  }
}
