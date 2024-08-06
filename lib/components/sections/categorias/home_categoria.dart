import 'package:flutter/material.dart';
import 'package:meu_tcc/data/produtos.model.dart';
import 'package:meu_tcc/data/services.dart';
import 'package:meu_tcc/helpers/confirmation_dialog_helper.dart';
import 'package:meu_tcc/main.dart';
import 'package:meu_tcc/themes/themes_colors.dart';

class HomeCategoria extends StatelessWidget {
  const HomeCategoria({super.key});

  Future<void> excluirCategoria(BuildContext context, int id) async {
    try {
      await CategoriaService().excluirCategoria(id);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Categoria excluída com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Categoria excluída com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

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
              future: CategoriaService().buscarCategorias(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: LoadingIndicator());
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
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                                      // FAZER TELA DE EDITAR
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      if (categoria.id != null) {
                                        ConfirmationDialogHelper
                                            .showConfirmationDialog(
                                          context,
                                          title: 'Confirmar Exclusão',
                                          content:
                                              'Tem certeza que deseja excluir esta categoria?',
                                          confirmationCallback: () async {
                                            await excluirCategoria(
                                                context, categoria.id!);
                                          },
                                          yesButtonColor: Colors.green,
                                          noButtonColor: Colors.grey,
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'ID da categoria inválido.'),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 5),
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
