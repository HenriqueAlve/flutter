import 'package:flutter/material.dart';
import 'package:meu_tcc/components/cards.dart';
import 'package:meu_tcc/data/produtos.model.dart';
import 'package:meu_tcc/data/services.dart';
import 'package:meu_tcc/screens/detalhes_do_produtos.dart';

class ListaDeProdutos extends StatefulWidget {
  const ListaDeProdutos({super.key});

  @override
  _ListaDeProdutosState createState() => _ListaDeProdutosState();
}

class _ListaDeProdutosState extends State<ListaDeProdutos> {
  late Future<List<ProdutoDTO>?> _futureProdutos;

  @override
  void initState() {
    super.initState();
    _futureProdutos = buscarProdutos() as Future<List<ProdutoDTO>?>;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        child: FutureBuilder<List<ProdutoDTO>?>(
          future: _futureProdutos,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Erro: ${snapshot.error}'));
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              var produtos = snapshot.data!;
              return Column(children: [
                Column(
                  children: produtos.map((produto) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalhesDoProdutos(
                              produto: produto,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Cards(
                          boxContent: Row(
                            children: [
                              produto.imagemBytes != null
                                  ? Image.memory(
                                      produto.imagemBytes!,
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    )
                                  : Container(
                                      width: 60,
                                      height: 60,
                                      color: Colors.grey,
                                      child: Icon(Icons.image, size: 30),
                                    ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      produto.nome,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Categoria: ${produto.categoriaDTO.nome}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      'Preço: R\$${produto.preco.toStringAsFixed(2)}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      'Quantidade em estoque: ${produto.quantiadeEmEstoque}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ]);
            } else {
              return const Center(child: Text('Nenhum dado disponível'));
            }
          },
        ),
      ),
    );
  }
}
