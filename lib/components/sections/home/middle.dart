import 'package:flutter/material.dart';
import 'package:meu_tcc/data/produtos.model.dart';
import 'package:meu_tcc/data/services.dart';
import 'package:meu_tcc/screens/adicionar_produto.dart';
import 'package:meu_tcc/screens/listagem_produtos.dart';
import 'package:meu_tcc/themes/my_themes.dart';
import 'package:meu_tcc/themes/themes_colors.dart';

class Middle extends StatelessWidget {
  const Middle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 5),
          child: Text(
            'Produtos de confeitaria',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        Container(
          width: 365,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ThemeColors.colorCard['cartao'],
            boxShadow: kElevationToShadow[3],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _RecentContent(),
          ),
        ),
      ],
    );
  }
}

class _RecentContent extends StatefulWidget {
  const _RecentContent({Key? key}) : super(key: key);

  @override
  _RecentContentState createState() => _RecentContentState();
}

class _RecentContentState extends State<_RecentContent> {
  late Future<List<ProdutoDTO>?> _futureProdutos;

  @override
  void initState() {
    super.initState();
    _futureProdutos = buscarProdutos() as Future<List<ProdutoDTO>?>;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProdutoDTO>?>(
      future: _futureProdutos,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else if (snapshot.hasData && snapshot.data != null) {
          var produtos = snapshot.data!;
          var produtosParaMostrar = produtos.take(3).toList();
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: produtosParaMostrar.length,
                  itemBuilder: (context, index) {
                    var produto = produtosParaMostrar[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: produto.imagemBytes != null
                                ? MemoryImage(produto.imagemBytes!)
                                : null,
                            child: produto.imagemBytes == null
                                ? const Icon(Icons.image, size: 30)
                                : null,
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  produto.nome,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  'Categoria: ${produto.categoriaDTO.nome}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  // Navega para a tela que lista todos os produtos
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TodosProdutosScreen(), // Tela que lista todos os produtos
                    ),
                  );
                },
                child: const Text(
                  'Ver Mais',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromRGBO(127, 151, 122, 1)),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdicionarProdutos()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyTheme.primaryColor,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ),
                ),
                child: const Text(
                  'Adicionar novo produto',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        } else {
          return const Center(child: Text('Nenhum dado disponível'));
        }
      },
    );
  }
}
