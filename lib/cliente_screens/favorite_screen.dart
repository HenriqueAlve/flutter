import 'package:flutter/material.dart';
import 'package:meu_tcc/data/produtos.model.dart';

class FavoriteScreen extends StatelessWidget {
  final List<ProdutoDTO> produtosFavoritados;

  const FavoriteScreen({
    Key? key,
    required this.produtosFavoritados,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
      ),
      body: ListView.builder(
        itemCount: produtosFavoritados.length,
        itemBuilder: (context, index) {
          final produto = produtosFavoritados[index];
          return ListTile(
            title: Text(produto.nome),
            subtitle: Text('R\$ ${produto.preco.toStringAsFixed(2)}'),
            leading: produto.imagemBytes != null
                ? Image.memory(
                    produto.imagemBytes!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )
                : Icon(Icons.image_not_supported),
          );
        },
      ),
    );
  }
}
