import 'package:flutter/material.dart';
import 'package:meu_tcc/data/produtos.model.dart';
import 'package:meu_tcc/data/services.dart';
import 'package:meu_tcc/main.dart';
import 'package:meu_tcc/themes/themes_colors.dart';

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
    try {
      final categorias = await CategoriaService().buscarCategorias();
      setState(() {
        _categorias = categorias;
      });
    } catch (e) {
      print('Erro ao carregar categorias: $e');
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
                        title: GestureDetector(
                          onTap: () {},
                          child: Container(
                              width: 300,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: ThemeColors.colorCard['cartao'],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      categoria.nome,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Icon(Icons.arrow_forward_ios_outlined)
                                  ],
                                ),
                              )),
                        ),
                        onTap: () {},
                      );
                    },
                  ),
          ),
        )
      ],
    );
  }
}
