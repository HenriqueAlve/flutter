import 'package:flutter/material.dart';
import 'package:meu_tcc/data/produtos.model.dart';
import 'package:meu_tcc/data/services.dart';
import 'package:meu_tcc/themes/themes_colors.dart';

class HomeCategoria extends StatelessWidget {
  const HomeCategoria({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 25),
          child: Text('Categorias atuais'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 5),
          child: Container(
            width: 343,
            height: 235,
            child: FutureBuilder<List<CategoriaDTO>>(
              future: buscarCategorias(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Erro ao carregar categorias'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Nenhuma categoria disponível'));
                } else {
                  final categorias = snapshot.data!;
                  return ListView.separated(
                    itemCount: categorias.length,
                    itemBuilder: (context, index) {
                      final categoria = categorias[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: ThemeColors.colorCard['cartao'],
                          border: Border.all(
                              color: Colors.grey), // Adiciona uma borda
                          borderRadius:
                              BorderRadius.circular(20), // Cantos arredondados
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ), // Espaçamento entre os itens
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  categoria.nome,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      // Ação ao clicar no botão de editar
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      // Ação ao clicar no botão de excluir
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          onTap: () {
                            // Ação ao clicar na categoria, se necessário
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 5), // Espaçamento entre os itens
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
