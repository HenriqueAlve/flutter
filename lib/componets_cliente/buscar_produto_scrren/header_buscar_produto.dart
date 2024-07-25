import 'package:flutter/material.dart';
import 'package:meu_tcc/cliente_screens/detalhes_produto_cliente_screen.dart';
import 'package:meu_tcc/data/produtos.model.dart';
import 'package:meu_tcc/data/services.dart';

class HeaderBuscarProduto extends StatefulWidget {
  const HeaderBuscarProduto({super.key});

  @override
  State<HeaderBuscarProduto> createState() => _HeaderBuscarProdutoState();
}

class _HeaderBuscarProdutoState extends State<HeaderBuscarProduto> {
  List<ProdutoDTO> _searchResults = [];
  bool _loading = false;
  String _query = '';

  Future<void> _search(String query) async {
    setState(() {
      _query = query;
      _loading = true;
    });

    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      setState(() {
        _loading = false;
      });
      return;
    }

    try {
      final results = await ProdutoService().buscarProdutos();
      setState(() {
        _searchResults =
            results.where((produto) => produto.nome.contains(query)).toList();
      });
    } catch (e) {
      print('Erro ao buscar produtos: $e');
      setState(() {
        _searchResults = [];
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, right: 50, left: 50),
            child: Container(
              height: 45,
              child: TextField(
                onChanged: (query) {
                  _search(query);
                },
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
                decoration: InputDecoration(
                  hintText: 'Buscar Produto',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Container(
              width: double.infinity,
              child: _loading
                  ? Center(child: CircularProgressIndicator())
                  : _searchResults.isEmpty
                      ? Center(child: Text(''))
                      : _searchResults.length == 1
                          ? _buildProductCard(_searchResults.first)
                          : Center(
                              child: Text('Mais de um produto encontrado')),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Acessos rápidos",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget _buildProductCard(ProdutoDTO produto) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetalhesDoProdutoScreen()));
      },
      child: Card(
        color: Color.fromRGBO(16, 20, 15, 1),
        margin: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: produto.imagemBytes != null
              ? Image.memory(
                  produto.imagemBytes!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )
              : null,
          title: Text(produto.nome),
          subtitle: Text('R\$ ${produto.preco.toStringAsFixed(2)}'),
        ),
      ),
    );
  }
}
