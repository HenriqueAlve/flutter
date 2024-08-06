import 'package:flutter/material.dart';
import 'package:meu_tcc/components/cards.dart';
import 'package:meu_tcc/data/produtos.model.dart';
import 'package:meu_tcc/data/services.dart';
import 'package:meu_tcc/screens/detalhes_do_produtos.dart';

class ListaDeEstoque extends StatefulWidget {
  final String searchQuery;

  const ListaDeEstoque({super.key, required this.searchQuery});

  @override
  State<ListaDeEstoque> createState() => _ListaDeEstoqueState();
}

class _ListaDeEstoqueState extends State<ListaDeEstoque> {
  late Future<List<ProdutoDTO>?> _futureProdutos;
  List<ProdutoDTO> _filteredProdutos = [];

  @override
  void initState() {
    super.initState();
    _futureProdutos = buscarProdutos() as Future<List<ProdutoDTO>?>;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            _filteredProdutos = produtos
                .where((produto) => produto.nome
                    .toLowerCase()
                    .contains(widget.searchQuery.toLowerCase()))
                .toList();

            return Column(
              children: _filteredProdutos.map((produto) {
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
                                  'Quantidade em estoque: ${produto.quantidadeNoEstoque}',
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
            );
          } else {
            return const Center(child: Text('Nenhum dado disponível'));
          }
        },
      ),
    );
  }
}
