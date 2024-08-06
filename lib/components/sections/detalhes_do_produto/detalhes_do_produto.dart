import 'package:flutter/material.dart';

import 'package:meu_tcc/data/produtos.model.dart';
import 'package:meu_tcc/data/services.dart';
import 'package:meu_tcc/helpers/confirmation_dialog_helper.dart';
import 'package:meu_tcc/themes/themes_colors.dart';

class HeaderDetalhesDoProduto extends StatelessWidget {
  final ProdutoDTO produto;

  const HeaderDetalhesDoProduto({Key? key, required this.produto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: produto.imagemBytes != null
                    ? Image.memory(
                        produto.imagemBytes!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        color: Colors.grey,
                        child: Icon(Icons.image, size: 30),
                      ),
              ),
              const SizedBox(width: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produto.nome,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        shadows: kElevationToShadow[8]),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Categoria: ${produto.categoriaDTO?.nome}',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Preço: R\$ ${produto.preco}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              Text(
                'Estoque: ${produto.quantidadeNoEstoque}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MinhaTelaDeEdicao()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeColors.primaryColor,
                  minimumSize: Size(70, 33),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text(
                  'Editar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(width: 5),
              ElevatedButton(
                onPressed: () {
                  ConfirmationDialogHelper.showConfirmationDialog(
                    context,
                    title: 'Confirmar exclusão',
                    content: 'Tem certeza que deseja excluir este produto?',
                    confirmationCallback: () {
                      if (produto.id != null) {
                        excluirProduto(produto.id!);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Produto excluído com sucesso!')),
                        );
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Erro: ID do produto é nulo')),
                        );
                      }
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.grey,
                  minimumSize: Size(70, 33),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text(
                  'Excluir',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
